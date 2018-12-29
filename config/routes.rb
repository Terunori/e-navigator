Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
    get 'users/edit_profile', to: 'devise/registrations#edit_profile', as: 'edit_profile'
    patch 'users/edit_profile', to: 'devise/registrations#edit_profile', as: 'update_profile'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
