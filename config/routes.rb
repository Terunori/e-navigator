Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
    get 'edit_profile', to: 'registrations#edit_profile', as: 'edit_profile'
    patch 'update_profile', to: 'registrations#update_profile', as: 'update_profile'
    get 'mypage', to: 'registrations#mypage', as: 'mypage'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
