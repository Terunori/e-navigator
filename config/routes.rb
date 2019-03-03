Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'users#index'
      delete 'logout', to: 'devise/sessions#destroy'
      resources :users, only: [:index, :show, :edit, :update] do
        resources :interviews do
          member do
            patch :allow, as: 'allow'
          end
          collection do
            post :notify_request
          end
        end
      end
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
