Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get '/list', to: "pages#show"
  resources :winners, only: [:index]

  
  authenticate :user do
  	resources :people, only: [:index, :new, :create, :edit, :update, :destroy]
  	get '/random', to: "pages#thechoosen"
  	get '/:id', to: "pages#index"
    resources :winners, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :people, only: [:show]

  devise_for :users, path_names: {sign_up: 'let_me_in'}


end


## admin - can add person

## super admin - can add admin, can add person