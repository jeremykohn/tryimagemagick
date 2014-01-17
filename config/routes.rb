Tryimagemagick::Application.routes.draw do
  resources :images

  root :to => "home#index"
  
  get '/about' => "home#about", as: 'about'
  
end
