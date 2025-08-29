import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  Card,
  CardContent,
  Typography,
  CircularProgress,
  Grid,
  Button,
} from "@mui/material";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import {
  Tooltip,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  Legend,
} from "recharts";

const COLORS = ["#0088FE", "#00C49F", "#FFBB28", "#FF8042"];

const TopRestaurantsByRevenue = () => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);

  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);

  const fetchTopRevenue = async () => {
    try {
      setLoading(true);
      const res = await axios.get(
        "http://127.0.0.1:8000/api/restaurants/top/revenue",
        {
          params: {
            start_date: startDate ? startDate.format("YYYY-MM-DD") : "",
            end_date: endDate ? endDate.format("YYYY-MM-DD") : "",
          },
        }
      );

      const formatted = res.data.map((item) => ({
        id: item.restaurant.id,
        name: item.restaurant.name,
        cuisine: item.restaurant.cuisine,
        location: item.restaurant.location,
        revenue: Number(item.total_revenue),
      }));
      setData(formatted);
    } catch (err) {
      console.error("Error fetching top revenue restaurants:", err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTopRevenue();
  }, []);

  return (
    <Card sx={{ mb: 3, p: 2 }}>
      <CardContent>
        <Typography variant="h6" gutterBottom>
          🏆 Top Restaurants by Revenue
        </Typography>

        {/* 🔹 Date Range Filters */}
        <LocalizationProvider dateAdapter={AdapterDayjs}>
          <Grid container spacing={2} alignItems="center" sx={{ mb: 2 }}>
            <Grid item xs={12} md={4}>
              <DatePicker
                label="Start Date"
                value={startDate}
                onChange={(newValue) => setStartDate(newValue)}
                slotProps={{ textField: { fullWidth: true } }}
              />
            </Grid>
            <Grid item xs={12} md={4}>
              <DatePicker
                label="End Date"
                value={endDate}
                onChange={(newValue) => setEndDate(newValue)}
                slotProps={{ textField: { fullWidth: true } }}
              />
            </Grid>
            <Grid item xs={12} md={4}>
              <Button
                variant="contained"
                color="primary"
                fullWidth
                onClick={fetchTopRevenue}
              >
                🔍 Apply Filters
              </Button>
            </Grid>
          </Grid>
        </LocalizationProvider>

        {loading ? (
          <CircularProgress />
        ) : (
          <Grid container spacing={2}>
            {/* 🔹 Pie Chart */}
            <Grid item xs={12} md={6} style={{ height: 300 }}>
              <Typography variant="subtitle1" gutterBottom>
                🥧 Revenue Distribution
              </Typography>
              <ResponsiveContainer width="400%" height="100%">
                <PieChart>
                  <Pie
                    data={data}
                    dataKey="revenue"
                    nameKey="name"
                    cx="50%"
                    cy="50%"
                    outerRadius={100}
                    label
                  >
                    {data.map((entry, index) => (
                      <Cell
                        key={`cell-${index}`}
                        fill={COLORS[index % COLORS.length]}
                      />
                    ))}
                  </Pie>
                  <Tooltip />
                  <Legend />
                </PieChart>
              </ResponsiveContainer>
            </Grid>
          </Grid>
        )}
      </CardContent>
    </Card>
  );
};

export default TopRestaurantsByRevenue;
