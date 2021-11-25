Rails.application.routes.draw do
  resources :homes
    root 'welcome#index'
    post 'run' => 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
