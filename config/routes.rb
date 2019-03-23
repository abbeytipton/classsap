Rails.application.routes.draw do


# Set index
get 'home/index'

# Sets index
root 'pages#index'

# Create new users
get 'signup'  => 'users#new'

# Resources
resources :users
resources :students
resources :products
resources :contacts
resources :messages
resources :password_resets

# Log in/out teacher users
get '/login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'

# Log in/out student users
get '/slogin' => 'sessions#new'
post 'slogin' => 'sessions#slogin'
delete 'slogout' => 'sessions#destroy_student'

# Get pages
get 'pages/about'
get 'pages/faq'
get 'pages/profile'
get 'pages/help'
get 'pages/support'
get 'pages/newaccount2'
get 'pages/points'
get 'pages/maintenance'
get 'pages/epoints'
get 'pages/estudents'
get 'pages/estore'
get 'pages/tmessages'
get 'pages/alerts'
get 'pages/newaccount'
get 'pages/slanding'
get 'pages/tlanding'
get 'pages/spoints'
get 'pages/smessages'
get 'pages/store'
get 'pages/index'
get 'pages/login'
get 'pages/slogin'
get 'pages/tlogin'
get 'pages/print'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
