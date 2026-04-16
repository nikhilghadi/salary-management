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
end