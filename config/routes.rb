Rails.application.routes.draw do
  root 'events#index'
	get 'static_pages/index'
  get 'static_pages/secret'
	#resources :users , only: [:show, :index]
	resources :events
  devise_for :users
	resources :users , only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
