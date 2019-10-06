Rails.application.routes.draw do
  root 'home#top'

  # authenticated :administrator do
  #   root to: 'user#index', as: :authenticated_root
  # end


  # devise_for :administrators, skip: [:sessions, :registrations]
  # as :administrator do
  #   get 'sign_in', to: 'home#top', as: :new_administrator_session
  #   post 'sign_in', to: 'administrators/sessions#create', as: :administrator_session
  #   post 'sign_up', to: 'administrators/registrations#create', as: :administrator_registration
  #   delete 'sign_out', to: 'home#top', as: :destroy_administrator_session
  # end


  devise_for :administrators, :controllers => {
    :registrations => 'administrators/registrations',
    :sessions => 'administrators/sessions'
  } 
  # devise_scope :administrator do
  #   :registrations => 'administrators/registrations'
  # end

  # root 'home#top'
  
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
