import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  Card,
  CardContent,
  Typography,
  CircularProgress,
  Grid,
} from "@mui/material";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import dayjs from "dayjs";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  BarChart,
  Bar,
} from "recharts";

const RestaurantTrends = ({ restaurantId }) => {
  const [startDate, setStartDate] = useState(dayjs().subtract(7, "day"));
  const [endDate, setEndDate] = useState(dayjs());
  const [trends, setTrends] = useState([]);
  const [loading, setLoading] = useState(false);

  const fetchTrends = async () => {
    try {
      setLoading(true);
      const res = await axios.get(
        `http://localhost:8000/api/restaurants/${restaurantId}/trends`,
        {
          params: {
            start_date: startDate.format("YYYY-MM-DD"),
            end_date: endDate.format("YYYY-MM-DD"),
          },
        }
      );

      const data = Object.entries(res.data).map(([date, stats]) => ({
        date,
        ...stats,
      }));
      setTrends(data);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTrends();
  }, [restaurantId, startDate, endDate]);

  return (
    <Card sx={{ mb: 3, p: 2 }}>
      <CardContent>
        <Typography variant="h6" gutterBottom>
          📊 Trends for Restaurant
        </Typography>

        {/* Date Filters */}
        <Grid container spacing={2} sx={{ mb: 2 }}>
          <Grid item xs={12} md={6}>
            <DatePicker
              label="Start Date"
              value={startDate}
              onChange={(newValue) => setStartDate(newValue)}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <DatePicker
              label="End Date"
              value={endDate}
              onChange={(newValue) => setEndDate(newValue)}
            />
          </Grid>
        </Grid>

        {loading ? (
          <CircularProgress />
        ) : (
          <>
            {/* Orders Trend */}
            <Typography variant="subtitle1">📈 Daily Orders</Typography>
            <LineChart width={600} height={300} data={trends}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Line type="monotone" dataKey="daily_orders" stroke="#8884d8" />
            </LineChart>

            {/* Revenue Trend */}
            <Typography variant="subtitle1" sx={{ mt: 3 }}>
              💰 Daily Revenue
            </Typography>
            <BarChart width={600} height={300} data={trends}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Bar dataKey="daily_revenue" fill="#82ca9d" />
            </BarChart>
          </>
        )}
      </CardContent>
    </Card>
  );
};

export default RestaurantTrends;
