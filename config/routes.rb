# == Route Map
#
#  Prefix Verb URI Pattern            Controller#Action
# student GET  /student/:id(.:format) student#show
#

Rails.application.routes.draw do
  resources :students, only: :show
end
