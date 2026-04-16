import { useEffect, useState } from "react";
import { createEmployee, updateEmployee} from "../api/client";

export default function AddEmployeeModal({employee, onClose, onSuccess }) {
  const [form, setForm] = useState({});
  const [errors, setErrors] = useState([]);

  useEffect(() => {
    setForm({
      id: employee?.id || "",
      first_name: employee?.first_name || "",
      last_name: employee?.last_name || "",
      emp_code: employee?.emp_code || "",
      job_title: employee?.job_title || "",
      country: employee?.country || "India",
      department: employee?.department || "",
      branch_location: employee?.branch_location || "",
      salary: employee?.salary || ""
    });
  }, [employee]);
  const handleSubmit = async () => {
    if (!form.first_name || !form.salary) {
      setErrors(["Required fields missing"]);
      return;
    }

    try {
      if( form.id){
        // update flow 
        await updateEmployee(form.id, form);
      }else{
        // create flow
        await createEmployee(form);
      }
      onSuccess();
    } catch (err) {
      setErrors(err.errors ||[ "Something went wrong"]);
    }
  };

  return (
    <div style={{ border: "1px solid black", padding: "20px" }}>
      {errors.length > 0 && (
        <div style={{ color: "red" }}>
          {errors.map((e, i) => (
            <p key={`error_${i}`}>{e}</p>
          ))}
        </div>
      )}
      <h3>Add Employee</h3>

      <input placeholder="First Name" value={form.first_name} onChange={e => setForm({...form, first_name: e.target.value})} />
      <input placeholder="Last Name" value={form.last_name} onChange={e => setForm({...form, last_name: e.target.value})} />
      <input placeholder="Employee Code" value={form.emp_code} onChange={e => setForm({...form, emp_code: e.target.value})} />

      
      <select onChange={e => setForm({...form, job_title: e.target.value})} value={form.job_title}>
        <option>Engineer</option>
        <option>Tester</option>
        <option>Manager</option>
        <option>Sales Executive</option>
        <option>Marketing Head</option>
      </select>

      <select onChange={e => setForm({...form, country: e.target.value})} value={form.country}>
        <option>India</option>
        <option>USA</option>
        <option>China</option>
        <option>Germany</option>
        <option>Brazil</option>
      </select>

      <input placeholder="Department" value={form.department} onChange={e => setForm({...form, department: e.target.value})} />
      <input placeholder="Branch Location" value={form.branch_location} onChange={e => setForm({...form, branch_location: e.target.value})} />

      <input type="number" placeholder="Salary" value={form.salary} onChange={e => setForm({...form, salary: e.target.value})} />

      <button onClick={handleSubmit}>Submit</button>
      <button onClick={onClose}>Cancel</button>
    </div>
  );
}