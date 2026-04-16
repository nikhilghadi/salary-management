import { useState } from "react";
import AddEmployeeModal from "./AddEmployeeModal";
import ViewEmployeeModal from "./ViewEmployeeModal";
import { deleteEmployee } from "../api/client";

export default function EmployeeTable({ employees, reload }) {
  const [selectedEmployee, setSelectedEmployee] = useState(null);
  const [mode, setMode] = useState(null); // view | edit

  const handleDelete = async (id) => {
    const confirmDelete = window.confirm("Are you sure?");
    if (!confirmDelete) return;

    await deleteEmployee(id);
    reload();
  };

  return (
    <div>
      <table border="1" cellPadding="10">
        <thead>
          <tr>
            <th>Emp Code</th>
            <th>Name</th>
            <th>Job Title</th>
            <th>Country</th>
            <th>Actions</th>
          </tr>
        </thead>

        <tbody>
          {employees.map(emp => (
            <tr key={emp.id}>
              <td>{emp.emp_code}</td>
              <td>{emp.first_name} {emp.last_name}</td>
              <td>{emp.job_title}</td>
              <td>{emp.country}</td>

              <td>
                <button onClick={() => {
                  setSelectedEmployee(emp);
                  setMode("view");
                }}>👁</button>

                <button onClick={() => {
                  setSelectedEmployee(emp);
                  setMode("edit");
                }}>✏️</button>

                <button onClick={() => handleDelete(emp.id)}>🗑</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* View Modal */}
      {mode === "view" && (
        <ViewEmployeeModal
          employee={selectedEmployee}
          onClose={() => setMode(null)}
        />
      )}

      {/* Edit Modal */}
      {mode === "edit" && (
        <AddEmployeeModal
          employee={selectedEmployee}
          onClose={() => setMode(null)}
          onSuccess={() => {
            setMode(null);
            reload();
          }}
        />
      )}
    </div>
  );
}