
export default function EmployeeList({ employees }) {

  return (
    <div>
      <h2>Employees</h2>
      <ul>
        {employees.map(emp => (
          <li key={`table-row-${emp.id}`}>
            {emp.first_name} {emp.last_name} - {emp.salary}
          </li>
        ))}
      </ul>
    </div>
  );
}