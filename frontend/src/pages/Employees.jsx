import { useState, useEffect } from "react";
import EmployeeTable from "../components/EmployeeTable";
import AddEmployeeModal from "../components/AddEmployeeModal";
import { fetchEmployees } from "../api/client";

export default function Employees() {
  const [employees, setEmployees] = useState([]);
  const [showModal, setShowModal] = useState(false);

  const loadEmployees = () => {
    fetchEmployees().then(setEmployees);
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