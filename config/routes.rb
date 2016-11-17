Rails.application.routes.draw do
  get 'check_in/show'

  get 'sponsors/new'
  post 'sponsors/create'

  #for searching for golf courses
  get 'tournaments/update_courses' => 'tournaments#update_courses'

  devise_for :people

  get '/players/:id' => 'players#show'#, constraints: { id: /^[1-9][0-9]*$/ }
  get 'players/list'
  get 'player/show'
  get 'players/new'
  post 'players/create'


  get 'welcome/index'

  #Rabachi: for the static pages
  get "/misc_pages/:misc_page" => "misc_pages#show"

  get 'tournaments/:id/organize' => "tournaments#organize"

  # RA: Added tournaments as a resource, this provides us with useful endpoints
  # that we'll probably use in the project (run: rails routes)
  resources :tournaments do
		resources :photos
		resources :sponsorships
  end

  resources :golf_courses
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Mailer Stuff
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'


  # saves a golf course after model validation
  # post '/create_golf_course', to: 'golf_courses#create_golf_course'
end
