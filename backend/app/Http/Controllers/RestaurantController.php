<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Restaurant;
use Carbon\Carbon;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    public function index(Request $request)
    {
        $query = Restaurant::query();
        if ($request->filled('q')) {
            $query->where('name', 'like', '%' . $request->q . '%');
        }
        if ($request->filled('location')) {
            $query->where('location', 'like', '%' . $request->location . '%');
        }
        if ($request->filled('cuisine')) {
            $query->where('cuisine', 'like', '%' . $request->cuisine . '%');
        }
        $sortBy = $request->get('sort_by', 'name');
        $sortOrder = $request->get('sort_order', 'asc');
        if (in_array($sortBy, ['name', 'location', 'cuisine'])) {
            $query->orderBy($sortBy, $sortOrder);
        }
        $restaurants = $query->paginate($request->get('per_page', 10));
        return response()->json([
            'current_page' => $restaurants->currentPage(),
            'per_page' => $restaurants->perPage(),
            'total' => $restaurants->total(),
            'data' => $restaurants->items()
        ]);
    }

    public function restaurantTrends(Request $request, $id)
    {
        $start = $request->get('start_date', now()->subDays(7)->startOfDay());
        $end = $request->get('end_date', now()->endOfDay());
        $orders = Order::where('restaurant_id', $id)
            ->whereBetween('order_time', [$start, $end])
            ->get();
        if ($orders->isEmpty()) {
            return response()->json([
                'message' => 'No orders found for this restaurant in the given range',
                'data' => []
            ]);
        }
        $stats = $orders->groupBy(fn($order) => $order->order_time->format('Y-m-d'))
            ->map(function ($dayOrders) {
                return [
                    'daily_orders' => $dayOrders->count(),
                    'daily_revenue' => $dayOrders->sum('order_amount'),
                    'average_order_value' => round($dayOrders->avg('order_amount'), 2),
                    'peak_order_hour' => $dayOrders
                        ->groupBy(fn($o) => $o->order_time->format('H'))
                        ->map->count()
                        ->sortDesc()
                        ->keys()
                        ->first(),
                ];
            });
        return response()->json($stats);
    }


    public function topByRevenue(Request $request)
    {
        if ($request->filled('start_date') || $request->filled('end_date')) {
            $start = $request->filled('start_date')
                ? Carbon::parse($request->start_date)->startOfDay()
                : now()->subDays(7)->startOfDay();

            $end = $request->filled('end_date')
                ? Carbon::parse($request->end_date)->endOfDay()
                : now()->endOfDay();

            $query = Order::whereBetween('order_time', [$start->toDateTimeString(), $end->toDateTimeString()]);
        } else {
            $query = Order::query();
        }

        $top = $query->selectRaw('restaurant_id, SUM(order_amount) as total_revenue')
            ->groupBy('restaurant_id')
            ->orderByDesc('total_revenue')
            ->with('restaurant')
            ->take(3)
            ->get();

        return response()->json($top);
    }


    public function filter(Request $request)
    {
        $query = Order::query();

        if ($request->has('restaurant_id')) {
            $query->where('restaurant_id', $request->restaurant_id);
        }
        if ($request->has('start_date') && $request->has('end_date')) {
            $query->whereBetween('order_time', [$request->start_date, $request->end_date]);
        }
        if ($request->has('min_amount') && $request->has('max_amount')) {
            $query->whereBetween('order_amount', [$request->min_amount, $request->max_amount]);
        }
        if ($request->has('start_hour') && $request->has('end_hour')) {
            $query->whereRaw('HOUR(order_time) BETWEEN ? AND ?', [
                $request->start_hour,
                $request->end_hour
            ]);
        }

        $orders = $query->paginate($request->get('per_page', 10));

        return response()->json([
            'current_page' => $orders->currentPage(),
            'per_page' => $orders->perPage(),
            'total' => $orders->total(),
            'last_page' => $orders->lastPage(),
            'data' => $orders->items()
        ]);
    }
}
