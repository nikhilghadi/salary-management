import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <div style={{ display: "flex", gap: "20px" }}>
      <Link to="/">Dashboard</Link>
      <Link to="/employees">Employee Directory</Link>
    </div>
  );
}