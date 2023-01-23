Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  resources :projects
  resources :client_informations
  resources :project_members
  resources :managers
  resources :stakeholders
  resources :team_members
end
