const BASE_URL = "http://localhost:3000";

export async function fetchEmployees() {
  const res = await fetch(`${BASE_URL}/employees`);
  return res.json();
}