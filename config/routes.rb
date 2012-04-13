Arpabet::Application.routes.draw do
  
  resources :words, :only => [:index, :show]

  match '/heroku/resources' => 'words#heroku', :as => :heroku_resources
  root :to => 'words#index'

end
