# == Route Map
#
#   Prefix Verb   URI Pattern             Controller#Action
#  student GET    /students/:id(.:format) students#show
# teachers GET    /teachers(.:format)     teachers#index
#  teacher DELETE /teachers/:id(.:format) teachers#destroy
# 

Rails.application.routes.draw do
  resources :students, only: :show
  resources :teachers, only: [:index, :destroy]
end
