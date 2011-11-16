Arpabet::Application.routes.draw do
  
  resources :words, :only => [:index, :show]

  root :to => 'words#index'

end
