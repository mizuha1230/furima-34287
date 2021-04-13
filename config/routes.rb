Rails.application.routes.draw do
  get 'items/index'
  get 'markets/index'
  root to: "items#index"
end
