Rails.application.routes.draw do

  resources :clients do
    get :issue_loan, on: :member
  end
  # devise_for :users, controllers: { sessions: 'sessions', registrations: "registrations" }
  devise_for :users, :path_prefix => 'my', controllers: {registrations: 'registrations'}
  # devise_for :users, :path_prefix => 'my', :skip => [:registrations]

  resources :users do
    post :unlock, :on => :member
  end
  # resources :users

  devise_scope :user do
    root 'devise/sessions#new'
  end


  get "welcome" => "welcomes#index"
  get "description" => "welcomes#description"

end


