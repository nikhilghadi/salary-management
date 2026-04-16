Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :employees, only: [:index, :create, :show, :update, :destroy]

  get "insights/country", to: "insights#country"
  get "insights/job_title", to: "insights#job_title"
  get "insights/median_salary", to: "insights#median_salary"
  get "insights/top_earners", to: "insights#top_earners"
end
