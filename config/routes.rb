Rails.application.routes.draw do
  get 'list' => 'contacts#list'
  post 'list' => 'contacts#list'

  get 'register' => 'contacts#register'

  get 'update' => 'contacts#update'

  get 'search' => 'contacts#search'

  post 'destroy' => 'contacts#destroy'
  post 'add_phone' => 'contacts#add_phone'

  root 'contacts#index'
end
