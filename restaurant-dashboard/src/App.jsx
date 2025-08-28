import React from "react";
import { Routes, Route, Link } from "react-router-dom";
import Restaurants from "./pages/Restaurants";

export default function App() {
  return (
    <div className="p-4">
      <nav className="flex gap-4 mb-6">
        <Link to="/">Restaurants</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Restaurants />} />
      </Routes>
    </div>
  );
}
