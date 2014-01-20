Tryimagemagick::Application.routes.draw do
  resources :images

  root :to => "home#index"
  
  get '/about' => "home#about", as: 'about'
  get '/finetune_image' => "home#finetune_image", as: 'finetune_image'
  
  
end
