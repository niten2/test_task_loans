Rails.application.routes.draw do


  # devise_for :users, controllers: { sessions: 'sessions', registrations: "registrations" }
  devise_for :users, :path_prefix => 'my', controllers: {registrations: 'registrations'}
  # devise_for :users, :path_prefix => 'my', :skip => [:registrations]

  resources :users, shallow: true do
    post :unlock, :on => :member
    get :admin_panel
    resources :clients, shallow: true do
      get :issue_loan, on: :member
      resources :loans, shallow: true
    end
  end
  # resources :users

  devise_scope :user do
    root 'devise/sessions#new'
  end


  get "welcome" => "welcomes#index"
  get "description" => "welcomes#description"

end


