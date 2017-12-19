Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    get 'login',      to: 'devise/sessions#new',        as: :new_user_session
    post 'login',     to: 'devise/sessions#create',     as: :user_session
    delete 'logout',  to: 'devise/sessions#destroy',    as: :destroy_user_session

    get 'cadastro',   to: 'devise/registrations#new',     as: :new_user_registration
    get 'cancel',     to: 'devise/registrations#cancel',  as: :cancel_user_registration
    post 'cadastro',  to: 'devise/registrations#create'
    patch 'cadastro', to: 'devise/registrations#update', as: :user_registration

  end

  namespace :admin do
    root 'dashboard#index'
  end

  namespace :student do
    root 'dashboard#index'
  end

  resources :answer_lists
  resources :simulation_answers
  resources :tickets
  resources :alternatives
  resources :images
  resources :solutions
  resources :exam_questions
  resources :comments
  resources :profiles
  resources :memberships
  resources :simulations
  resources :questions
  resources :exams
  resources :plans
end
