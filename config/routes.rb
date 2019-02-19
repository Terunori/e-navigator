Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'users#index'
      delete 'logout', to: 'devise/sessions#destroy'
      get 'users/edit_profile', to: 'users/registrations#edit_profile', as: 'edit_profile'
      patch 'users/update_profile', to: 'users/registrations#update_profile', as: 'update_profile'
      get 'users/mypage', to: 'users#mypage', as: 'mypage'
      resources :users, only: [:index] do
        resources :interviews do
          member do
            patch :allow, as: 'allow'
          end
        end
      end
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
