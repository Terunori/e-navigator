Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
    get 'users/edit_profile', to: 'users/registrations#edit_profile', as: 'edit_profile'
    patch 'users/update_profile', to: 'users/registrations#update_profile', as: 'update_profile'
    get 'users/mypage', to: 'users#mypage', as: 'mypage'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
