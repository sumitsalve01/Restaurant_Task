import React, { useState } from "react";
import {
  Container,
  Typography,
  Drawer,
  List,
  ListItem,
  ListItemText,
  Toolbar,
  AppBar,
  CssBaseline,
  Box,
} from "@mui/material";
import { LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

import RestaurantList from "./dashboard/RestaurantList";
import RestaurantTrends from "./dashboard/RestaurantTrends";
import TopRestaurantsByRevenue from "./dashboard/TopRestaurantsByRevenue";

const drawerWidth = 240;

const App = () => {
  const [selectedView, setSelectedView] = useState("revenue");
  const [selectedRestaurant, setSelectedRestaurant] = useState(null);

  return (
    <LocalizationProvider dateAdapter={AdapterDayjs}>
      <Box sx={{ display: "flex" }}>
        <CssBaseline />

        {/* 🔹 Top App Bar */}
        <AppBar
          position="fixed"
          sx={{ zIndex: (theme) => theme.zIndex.drawer + 1 }}
        >
          <Toolbar>
            <Typography variant="h6" noWrap component="div">
              🍽️ Restaurant Analytics Dashboard
            </Typography>
          </Toolbar>
        </AppBar>

        {/* 🔹 Sidebar Drawer */}
        <Drawer
          variant="permanent"
          sx={{
            width: drawerWidth,
            flexShrink: 0,
            [`& .MuiDrawer-paper`]: {
              width: drawerWidth,
              boxSizing: "border-box",
            },
          }}
        >
          <Toolbar />
          <List>
            <ListItem
              button
              selected={selectedView === "revenue"}
              onClick={() => setSelectedView("revenue")}
            >
              <ListItemText primary="🏆 Top Revenue" />
            </ListItem>
            <ListItem
              button
              selected={selectedView === "list"}
              onClick={() => setSelectedView("list")}
            >
              <ListItemText primary="📋 Restaurant List" />
            </ListItem>
          </List>
        </Drawer>

        {/* 🔹 Main Content */}
        <Box
          component="main"
          sx={{
            flexGrow: 1,
            bgcolor: "background.default",
            p: 3,
            minHeight: "100vh",
          }}
        >
          <Toolbar /> {/* Space below AppBar */}

          {selectedView === "revenue" && <TopRestaurantsByRevenue />}
          {selectedView === "list" && (
            <>
              <RestaurantList onRestaurantSelect={setSelectedRestaurant} />
              {selectedRestaurant && (
                <RestaurantTrends restaurantId={selectedRestaurant} />
              )}
            </>
          )}
        </Box>
      </Box>
    </LocalizationProvider>
  );
};

export default App;
