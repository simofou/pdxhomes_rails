Rails.application.routes.draw do
  resources :homes
    root 'welcome#index'
end
