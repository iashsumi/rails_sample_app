Rails.application.routes.draw do
  root 'home#top'

  devise_for :administrators, skip: :all
  devise_scope :administrator do
    get 'login' => 'administrators/sessions#new', as: :new_administrator_session
    post 'login' => 'administrators/sessions#create', as: :administrator_session
    delete 'logout' => 'administrators/sessions#destroy', as: :destroy_administrator_session
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      post 'new_confirm'
      get 'new_all'
      post 'import'
    end
    member do
      patch 'edit_confirm'
    end
  end
end
