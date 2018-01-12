Rails.application.routes.draw do
  root 'home#index'

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

    constraints(Constraints::RestrictedUserKind) do
      get '*user_kind/conta/editar',  to: 'users/registrations#edit', as: :edit_user_registration
    end
  end

  resources :registration_steps, path: '/cadastro/informacoes'

  namespace :admin do
    root 'dashboard#index'
    resources :history, only: :index
    resources :exams
  end

  namespace :student do
    root 'dashboard#index'
  end

  scope module: 'users' do
    scope '*user_kind' do
      resource :profile, except: [:index, :destroy], constraints: Constraints::RestrictedUserKind
    end
  end

end
