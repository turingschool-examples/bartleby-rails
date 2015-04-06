Rails.application.routes.draw do
  namespace "api" do
    resources :notes, defaults: { format: "json" }
  end

  resources :notes
  get "/dashboard", to: "dashboard#index"
end
