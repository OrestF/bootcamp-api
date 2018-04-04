Rails.application.routes.draw do
  apipie
  root to: 'home#index'
  get 'home/index'
  get 'home/users' => 'home#users'
  get 'home/books' => 'home#books'

  scope '/api', defaults: { format: :json } do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
