import { useState } from 'react'
import './App.css'
import EmployeeList from "./components/EmployeeList";
import AddEmployee from "./components/AddEmployee";
import Insights from './components/Insights';

function App() {
  return (
    <>
      <h1>Salary Manager</h1>
        <EmployeeList />
        <AddEmployee />
        <Insights/>
    </>
  )
}

export default App
