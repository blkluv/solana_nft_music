Rails.application.routes.draw do
  devise_for :users
  get 'genres/index'
  get 'genres/show'
  # Page d'accueil
  root 'home#index'

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  
  resource :profile, only: [:edit, :update]
  
  # Routes pour les utilisateurs
  resources :users, only: [:show, :edit, :update] do
    get 'dashboard', on: :member
  end

  # Route to get trending Artists
    get 'update_trending_artist', to: 'home#update_trending_artist'
  
  # Routes pour les albums
  resources :albums do
    member do
      post 'mint' # Route pour le minting d'un album
    end
    
    # Routes imbriquées pour les pistes d'un album
    resources :tracks, except: [:index] do
      member do
        post 'mint' # Route pour le minting d'une piste individuelle
      end
    end
  end
  
  # Routes pour les transactions
  resources :transactions, only: [:index, :show, :create]
  
  # Routes pour les genres (pour la navigation et le filtrage)
  resources :genres, only: [:index, :show]
  
  # Routes pour les wallets Solana
  resource :wallet, only: [] do
    post 'connect'
    post 'disconnect'
    post 'verify'
  end
  
  # Pages statiques
  get 'about', to: 'home#about'
  get 'faq', to: 'home#faq'
  get 'terms', to: 'home#terms'
  get 'privacy', to: 'home#privacy'
end