Rails.application.routes.draw do

  root 'home#index'

  post '/webhooks', to: 'stripe#webhooks'

  devise_for :users, skip: [:sessions, :registrations],
              controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  as :user do
    get 'login',      to: 'devise/sessions#new',        as: :new_user_session
    post 'login',     to: 'devise/sessions#create',     as: :user_session
    delete 'logout',  to: 'devise/sessions#destroy',    as: :destroy_user_session

    get 'cadastro',   to: 'users/registrations#new',     as: :new_user_registration
    get 'cancel',     to: 'users/registrations#cancel',  as: :cancel_user_registration
    post 'cadastro',  to: 'users/registrations#create'
    patch 'cadastro', to: 'users/registrations#update', as: :user_registration
    put 'cadastro',   to: 'users/registrations#update'

    resources :contacts, only: [:new, :create]

    constraints(Constraints::RestrictedUserKind) do
      get '*user_kind/conta/editar',  to: 'users/registrations#edit', as: :edit_user_registration
    end
  end

  resources :registration_steps, path: '/cadastro/informacoes'
  match 'admin/users/:id/ban', :to => 'admin/users#ban', :as => 'admin_user_ban', :via => :post

  namespace :admin do
    root 'dashboard#index'
    resources :history, only: :index
    resources :plans
    resources :users
  end

  namespace :student do
    root 'dashboard#index'
    get 'ranking', to: 'ranking#index'
    resources :simulations, only: [:index, :answering, :answer_list] do
      get 'answering', on: :member
      get 'answer_list', on: :member
      post 'finished', on: :member
      resources :questions, only: [] do
        resources :simulation_answers, only: [:create, :update]
      end
    end
    resources :plans, only: :index do
      resources :subscriptions
    end
  end

  scope '*user_kind', module: 'users' do
    resource :profile, except: [:index, :destroy]
    resource :address, except: [:index, :destroy]
    resources :questions do
      resources :tickets, except: [:edit, :update, :destroy], module: 'questions'
    end
    resources :exams do
      post 'generate', on: :member
      resources :simulations, only: [:new, :create], controller: '/student/simulations'
    end
  end

end
