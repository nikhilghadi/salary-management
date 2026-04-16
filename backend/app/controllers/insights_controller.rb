class InsightsController < ApplicationController
  def country
    insights = SalaryInsights.for_country(params[:country])
    render json: insights
  end
end