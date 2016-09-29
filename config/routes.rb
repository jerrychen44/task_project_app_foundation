Rails.application.routes.draw do

  #set root
  root 'pages#home'

  #get 'pages/contact'
  get "contact", to: "pages#contact"
  #get 'pages/about'
  get "about", to: "pages#about"
  get "error", to: "pages#error"

  resources :projects

  #learn how to redirect the localhost:3000/blog  to yahoo
  get 'blog', to:redirect("http://yahoo.com.tw")
  # catch the *path, put near the end or the routes.rb
  get '*path', to: redirect("/error")

end
