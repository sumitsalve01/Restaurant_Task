import React from "react";
import { useQuery } from "@tanstack/react-query";
import axios from "axios";

const API_BASE = "http://127.0.0.1:8000/api"; // Laravel backend

export default function Restaurants() {
  const { data, isLoading, error } = useQuery({
    queryKey: ["restaurants"],
    queryFn: async () => {
      const res = await axios.get(`${API_BASE}/restaurants`);
      console.log("💀💀", res.data);
      return res.data;
    },
  });

  if (isLoading) return <p>Loading...</p>;
  if (error) return <p>Error fetching restaurants</p>;
  if (!data?.data?.length) return <p>No restaurants found</p>;

  return (
    <div>
      <h2 className="text-xl font-bold mb-4">Restaurants</h2>
      <ul>
        {data.data.map((r) => (
          <li key={r.id}>
            {r.name} - {r.location} ({r.cuisine})
          </li>
        ))}
      </ul>
    </div>
  );
}
