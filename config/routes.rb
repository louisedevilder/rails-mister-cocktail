Rails.application.routes.draw do
  root to: 'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:show, :new, :create, :destroy], shallow: true
  end
  mount Attachinary::Engine => "/attachinary"
end
