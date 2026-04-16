import { useState, useEffect } from "react";
import EmployeeTable from "../components/EmployeeTable";
import AddEmployeeModal from "../components/AddEmployeeModal";
import { fetchEmployees } from "../api/client";

export default function Employees() {
  const [employees, setEmployees] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [page, setPage] = useState(1);

  const loadEmployees = (page = 1) => {
    fetchEmployees(page).then(data => {
      setEmployees(data.data);
      setPage(data.page);
    });
  };

  useEffect(() => {
    loadEmployees();
  }, []);

  return (
    <div>
      <h2>Employee Directory</h2>

      <button onClick={() => setShowModal(true)}>
        Add Employee
      </button>

      <EmployeeTable employees={employees} reload={loadEmployees} />

      <button onClick={() => loadEmployees(page - 1)}>Prev</button>
      <button onClick={() => loadEmployees(page + 1)}>Next</button>

      {showModal && (
        <AddEmployeeModal
          onClose={() => setShowModal(false)}
          onSuccess={() => {
            setShowModal(false);
            loadEmployees();
          }}
        />
      )}
    </div>
  );
}