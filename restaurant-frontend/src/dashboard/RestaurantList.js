import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  Card,
  CardContent,
  Typography,
  CircularProgress,
  TextField,
  Button,
  Grid,
} from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";

const RestaurantList = ({ onRestaurantSelect }) => {
  const [restaurants, setRestaurants] = useState([]);
  const [query, setQuery] = useState("");
  const [location, setLocation] = useState("");
  const [cuisine, setCuisine] = useState("");
  const [page, setPage] = useState(1);
  const [perPage, setPerPage] = useState(5);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(false);

  const fetchRestaurants = async () => {
    try {
      setLoading(true);
      const res = await axios.get("http://localhost:8000/api/restaurants", {
        params: {
          q: query,
          location,
          cuisine,
          per_page: perPage,
          page,
        },
      });
      setRestaurants(res.data.data);
      setTotal(res.data.total);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchRestaurants();
  }, [query, location, cuisine, page, perPage]);

  // ✅ Reset filters
  const handleReset = () => {
    setQuery("");
    setLocation("");
    setCuisine("");
    setPage(1);
    fetchRestaurants();
  };

  return (
    <Card sx={{ mb: 3, p: 2 }}>
      <CardContent>
        <Typography variant="h6" gutterBottom>
          🍽️ Restaurant List
        </Typography>

        {/* 🔍 Filters */}
        <Grid container spacing={2} sx={{ mb: 2 }}>
          <Grid item xs={3}>
            <TextField
              label="Search by name"
              variant="outlined"
              fullWidth
              value={query}
              onChange={(e) => setQuery(e.target.value)}
            />
          </Grid>
          <Grid item xs={3}>
            <TextField
              label="Filter by location"
              variant="outlined"
              fullWidth
              value={location}
              onChange={(e) => setLocation(e.target.value)}
            />
          </Grid>
          <Grid item xs={3}>
            <TextField
              label="Filter by cuisine"
              variant="outlined"
              fullWidth
              value={cuisine}
              onChange={(e) => setCuisine(e.target.value)}
            />
          </Grid>
          <Grid item xs={3} display="flex" alignItems="center">
            <Button
              variant="outlined"
              color="secondary"
              onClick={handleReset}
              fullWidth
            >
              Reset Filters
            </Button>
          </Grid>
        </Grid>

        {/* 📋 Data Table */}
        {loading ? (
          <CircularProgress />
        ) : (
          <div style={{ height: 400, width: "100%" }}>
            <DataGrid
              rows={restaurants}
              columns={[
                { field: "name", headerName: "Name", width: 200 },
                { field: "location", headerName: "Location", width: 200 },
                { field: "cuisine", headerName: "Cuisine", width: 200 },
              ]}
              pageSize={perPage}
              rowCount={total}
              pagination
              paginationMode="server"
              onPageChange={(newPage) => setPage(newPage + 1)} // DataGrid is 0-based
              onPageSizeChange={(newSize) => setPerPage(newSize)}
              rowsPerPageOptions={[5, 10, 20]}
              onRowClick={(params) => onRestaurantSelect(params.row.id)}
              getRowId={(row) => row.id}
            />
          </div>
        )}
      </CardContent>
    </Card>
  );
};

export default RestaurantList;
