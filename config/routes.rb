Rails.application.routes.draw do
  get 'sessions/new'
  #sessionに対応するもの
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'
  resources :users
get 'chat_messages/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
