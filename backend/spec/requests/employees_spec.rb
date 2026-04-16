require 'rails_helper'

RSpec.describe "Employees API", type: :request do
  describe "GET /employees" do
    it "returns all employees" do
      create_list(:employee, 3)

      get "/employees"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /employees" do
    it "creates a new employee" do
      params = {
        employee: {
          first_name: "Nikhil",
          last_name: "Ghadi",
          emp_code: "E12345",
          job_title: "Engineer",
          country: "India",
          branch_location: "Bangalore",
          department: "Engineering",
          salary: 50000
        }
      }

      expect {
        post "/employees", params: params
      }.to change(Employee, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /employees/:id" do
    it "returns the employee" do
      employee = create(:employee)

      get "/employees/#{employee.id}"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)

      expect(data["id"]).to eq(employee.id)
      expect(data["first_name"]).to eq(employee.first_name)
    end
  end

  it "returns 404 if employee not found" do
    get "/employees/99999"

    expect(response).to have_http_status(:not_found)
  end

  describe "PUT /employees/:id" do
    it "updates the employee" do
      employee = create(:employee)

      put "/employees/#{employee.id}", params: {
        employee: { salary: 70000 }
      }

      expect(response).to have_http_status(:ok)
      expect(employee.reload.salary).to eq(70000)
    end
  end

  describe "DELETE /employees/:id" do
    it "deletes the employee" do
      employee = create(:employee)

      expect {
        delete "/employees/#{employee.id}"
      }.to change(Employee, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end