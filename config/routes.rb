Rails.application.routes.draw do
	root 'posts#index'

	get    '/login',         to: 'sessions#new'
  post   '/login',         to: 'sessions#create'
  delete '/logout',        to: 'sessions#destroy'
  get    '/posts/new',     to: 'posts#new'
  post   '/posts/new',     to: 'posts#create'
  get    '/posts/all',     to: 'posts#index'
end
