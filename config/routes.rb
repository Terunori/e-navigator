Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'users#index'
    devise_scope :user do
      delete 'logout', to: 'devise/sessions#destroy'
      get 'users/edit_profile', to: 'users/registrations#edit_profile', as: 'edit_profile'
      patch 'users/update_profile', to: 'users/registrations#update_profile', as: 'update_profile'
      get 'users/mypage', to: 'users#mypage', as: 'mypage'
      resources :users, only: [:index] do
        resources :interviews
      end
    end
  end
  root 'users#index'
end
