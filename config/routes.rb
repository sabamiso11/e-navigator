Rails.application.routes.draw do
  devise_for :users
 # root 'users#index'
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

#  get 'pages/show'
  resources :users do
    resources :interviews do
      member do
        post 'state'
      end
    end
  end


#  as :user do
#    get 'devise/registrations#edit', :to => 'users#show', :as => :user_root
#  end

#  resources :interviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
