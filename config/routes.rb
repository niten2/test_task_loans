Rails.application.routes.draw do

  devise_for :users, :path_prefix => 'my', controllers: {registrations: 'registrations'}

  resources :users, shallow: true do
    post :unlock, :on => :member
    post :lock, :on => :member
    get :admin_panel
    resources :clients, shallow: true do
      get :mark_removal, on: :member
      get :issue_loan, on: :member
      resources :loans, shallow: true
    end
  end

  devise_scope :user do
    root 'devise/sessions#new'
    # get "logout" => "sessions#destroy", :as => "logout"
  end

  get "welcome" => "welcomes#index"
  get "description" => "welcomes#description"

end


