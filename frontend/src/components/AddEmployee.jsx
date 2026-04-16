import { useState } from "react";
import { createEmployee } from "../api/client";

export default function AddEmployee({ onEmployeeAdded }) {
  const [form, setForm] = useState({
    first_name: "",
    last_name: "",
    emp_code: "",
    job_title: "",
    country: "",
    department: "",
    branch_location: "",
    salary: ""
  });

  const handleSubmit = async (e) => {
    e.preventDefault();
    await createEmployee(form);
    onEmployeeAdded();
    alert("Employee added!");
  };

  return (
    <form onSubmit={handleSubmit}>
      <input placeholder="First Name" onChange={e => setForm({...form, first_name: e.target.value})} />
      <input placeholder="Last Name" onChange={e => setForm({...form, last_name: e.target.value})} />
      <input placeholder="Employee Code" onChange={e => setForm({...form, emp_code: e.target.value})} />
      <input placeholder="Job Title" onChange={e => setForm({...form, job_title: e.target.value})} />
      <input placeholder="Country" onChange={e => setForm({...form, country: e.target.value})} />
      <input placeholder="Department" onChange={e => setForm({...form, department: e.target.value})} />
      <input placeholder="Branch Location" onChange={e => setForm({...form, branch_location: e.target.value})} />
      <input placeholder="Salary" type="number" onChange={e => setForm({...form, salary: e.target.value})} />
      <button type="submit">Add</button>
    </form>
  );
}