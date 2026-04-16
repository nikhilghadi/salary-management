export default function ViewEmployeeModal({ employee, onClose }) {
  return (
    <div style={{ border: "1px solid black", padding: "20px" }}>
      <h3>Employee Details</h3>

      <p><b>Code:</b> {employee.emp_code}</p>
      <p><b>Name:</b> {employee.first_name} {employee.last_name}</p>
      <p><b>Job Title:</b> {employee.job_title}</p>
      <p><b>Department:</b> {employee.department}</p>
      <p><b>Country:</b> {employee.country}</p>
      <p><b>Branch:</b> {employee.branch_location}</p>
      <p><b>Salary:</b> {employee.salary}</p>

      <button onClick={onClose}>Close</button>
    </div>
  );
}