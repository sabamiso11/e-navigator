Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  resources :users do
    resources :interviews do
      post 'state', on: :member
    end
    post 'desired', on: :member
  end

  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
