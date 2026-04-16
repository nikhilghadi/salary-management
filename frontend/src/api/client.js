const BASE_URL = "http://localhost:3000";

export async function fetchEmployees() {
  const res = await fetch(`${BASE_URL}/employees`);
  return res.json();
}

export async function createEmployee(data) {
  const res = await fetch(`${BASE_URL}/employees`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ employee: data })
  });

  return res.json();
}