require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is valid with valid attributes" do
    employee = Employee.new(
      first_name: "Nikhil",
      last_name: "Ghadi",
      emp_code: "E12345",
      job_title: "Engineer",
      country: "India",
      department: "Engineering",
      branch_location: "Bangalore",
      salary: 50000
    )

    expect(employee).to be_valid
  end

  it "is invalid without emp_code" do
    employee = Employee.new(
      first_name: "Nikhil",
      last_name: "Ghadi",
      job_title: "Engineer",
      country: "India",
      department: "Engineering",
      branch_location: "Bangalore",
      salary: 50000
    )

    expect(employee).not_to be_valid
  end

  it "is invalid without salary" do
    employee = Employee.new(
      first_name: "Nikhil",
      last_name: "Ghadi",
      emp_code: "E12345",
      job_title: "Engineer",
      country: "India",
      department: "Engineering",
      branch_location: "Bangalore",
    )

    expect(employee).not_to be_valid
  end

  it "is invalid if salary is not a number" do
    employee = Employee.new(
      first_name: "Nikhil",
      last_name: "Ghadi",
      emp_code: "E12345",
      job_title: "Engineer",
      country: "India",
      department: "Engineering",
      branch_location: "Bangalore",
      salary: "abc"
    )

    expect(employee).not_to be_valid
  end

  it "is invalid if salary is less than or equal to 0" do
    employee = Employee.new(
      first_name: "Nikhil",
      last_name: "Ghadi",
      emp_code: "E12345",
      job_title: "Engineer",
      country: "India",
      department: "Engineering",
      branch_location: "Bangalore",
      salary: 0
    )

    expect(employee).not_to be_valid
  end
end