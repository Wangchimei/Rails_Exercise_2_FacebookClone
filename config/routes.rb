Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  resources :feeds do
    collection do 
      post :confirm
    end
  end
  
  resources :users, only: [:new, :create, :edit, :update, :show]
 
  root 'feeds#index'
end
