Myapp::Application.routes.draw do
  


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :tattoos do
    resources :comments
  end

end