Rails.application.routes.draw do

  resources :clients
  # devise_for :users, controllers: { sessions: 'sessions', registrations: "registrations" }
  devise_for :users, :path_prefix => 'my', controllers: {registrations: 'registrations'}
  # devise_for :users, :path_prefix => 'my', :skip => [:registrations]

  resources :users
  # resources :users

  devise_scope :user do
    root 'devise/sessions#new'
    # post '/finish_sign_up' => 'registrations#finish_sign_up'
  end


  get "welcome" => "welcomes#index"
  # get "ajax" => "welcome#ajax"

  # resources :attachments, only: :destroy
  # resources :comments, only: [:create, :destroy]

  # concern :votable do
  #   member do
  #     patch :upvote
  #     patch :downvote
  #     patch :unvote
  #   end
  # end

  # resources :questions, concerns: :votable do
  #   resources :comments, only: :create, defaults: {commentable: 'questions'}

  #   resources :answers, shallow: true, concerns: :votable do
  #     resources :comments, only: :create, defaults: {commentable: 'questions'}
  #     patch :make_best, on: :member
  #   end
  # end

end

