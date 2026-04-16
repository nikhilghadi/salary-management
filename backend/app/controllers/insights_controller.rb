class InsightsController < ApplicationController
  def country
    if params[:country].blank?
      return render json: { error: "country parameter is required" }, status: :unprocessable_entity
    end
    insights = SalaryInsights.for_country(params[:country])
    render json: insights
  end
end