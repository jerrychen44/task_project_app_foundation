Rails.application.routes.draw do



  devise_for :users
  #set root
  root 'pages#home'

  #get 'pages/contact'
  get "contact", to: "pages#contact"
  #get 'pages/about'
  get "about", to: "pages#about"
  get "error", to: "pages#error"

  #nested the routes => .com/projects/5/tasks/2, task2 belong to project 5
  # create the folder projects inside the controllers, and move old
  #tasks_controller.rb into it.
  # remember , do the same thing in your views, move the tasks folder
  # into projects.
  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end

  #learn how to redirect the localhost:3000/blog  to yahoo
  get 'blog', to:redirect("http://yahoo.com.tw")
  # catch the *path, put near the end or the routes.rb
  get '*path', to: redirect("/error")

end
