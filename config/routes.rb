Rails.application.routes.draw do
  get 'list' => 'contacts#list'
  post 'list' => 'contacts#list'

  get 'register' => 'contacts#register'

  get 'update' => 'contacts#update'

  post 'destroy' => 'contacts#destroy'
  post 'add_phone' => 'contacts#add_phone'

  root 'contacts#index'
end
