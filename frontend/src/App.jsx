import { useState, useEffect } from 'react'
import './App.css'
import EmployeeList from "./components/EmployeeList";
import AddEmployee from "./components/AddEmployee";
import Insights from './components/Insights';
import { fetchEmployees } from "./api/client";

function App() {
  const [employees, setEmployees] = useState([]);

  const loadEmployees = () => {
    fetchEmployees().then(setEmployees);
  };


  useEffect(() => {
    loadEmployees();
  }, []);
  return (
    <>
      <h1>Salary Manager</h1>
        <EmployeeList employees={employees} />
        <AddEmployee onEmployeeAdded={loadEmployees} />
        <Insights/>
    </>
  )
}

export default App
