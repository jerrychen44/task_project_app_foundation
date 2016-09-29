Rails.application.routes.draw do
  #get 'pages/contact'
  get "contact", to: "pages#contact"
  #get 'pages/about'
  get "about", to: "pages#about"


  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'pages#home'
end
