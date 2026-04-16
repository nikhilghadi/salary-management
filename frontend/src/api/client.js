const BASE_URL = "http://localhost:3000";

export async function fetchEmployees(page=1) {
  const res = await fetch(`${BASE_URL}/employees?page=${page}`);
  return res.json();
}

export async function createEmployee(data) {
  const res = await fetch(`${BASE_URL}/employees`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ employee: data })
  });

  const json = await res.json();

  if (!res.ok) {
    throw json;
  }

  return json;
}

export async function getEmployee(id) {
  const res = await fetch(`http://localhost:3000/employees/${id}`);
  return res.json();
}

export async function updateEmployee(id, data) {
  const res = await fetch(`http://localhost:3000/employees/${id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ employee: data })
  });
   const json = await res.json();

  if (!res.ok) {
    throw json;
  }

  return json;
}

export async function deleteEmployee(id) {
  await fetch(`http://localhost:3000/employees/${id}`, {
    method: "DELETE"
  });
}

export async function getCountryInsights(country) {
  const res = await fetch(`${BASE_URL}/insights/country?country=${country}`);
  return res.json();
}

export async function getJobInsights(country, jobTitle) {
  const res = await fetch(`${BASE_URL}/insights/job_title?country=${country}&job_title=${jobTitle}`);
  return res.json();
}