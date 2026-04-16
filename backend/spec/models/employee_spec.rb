require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is valid with valid attributes" do
    expect(build(:employee)).to be_valid
  end

  it "is invalid without emp_code" do
    employee = build(:employee, emp_code: nil)

    expect(employee).not_to be_valid
  end

  it "is invalid without salary" do
    employee = build(:employee, salary: nil)

    expect(employee).not_to be_valid
  end

  it "is invalid if salary is not a number" do
    employee = build(:employee, salary: "abc")

    expect(employee).not_to be_valid
  end

  it "is invalid if salary is less than or equal to 0" do
    employee = build(:employee, salary: 0)

    expect(employee).not_to be_valid
  end

  it "is invalid if salary is less than or equal to 0" do
    employee = build(:employee, salary: -100)

    expect(employee).not_to be_valid
  end
end