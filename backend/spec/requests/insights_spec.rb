require 'rails_helper'

RSpec.describe "Insights API", type: :request do
  describe "GET /insights/country" do
    it "returns min, max and avg salary for a country" do
      create(:employee, country: "India", salary: 30000)
      create(:employee, country: "India", salary: 50000)
      create(:employee, country: "India", salary: 70000)

      get "/insights/country", params: { country: "India" }

      expect(response).to have_http_status(:ok)

      data = JSON.parse(response.body)

      expect(data["min_salary"]).to eq(30000)
      expect(data["max_salary"]).to eq(70000)
      expect(data["avg_salary"]).to eq(50000)
    end
  end

  it "returns empty values if no employees found" do
    get "/insights/country", params: { country: "America" }

    data = JSON.parse(response.body)

    expect(data["min_salary"]).to be_nil
    expect(data["max_salary"]).to be_nil
    expect(data["avg_salary"]).to be_nil
  end

  it "returns error when country param is missing" do
    create(:employee, country: "India", salary: 30000)
    create(:employee, country: "India", salary: 50000)
    get "/insights/country"
    p response.body
    expect(response).to have_http_status(:unprocessable_entity)

    data = JSON.parse(response.body)
    expect(data["error"]).to eq("country parameter is required")
  end
end