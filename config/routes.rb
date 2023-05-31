Rails.application.routes.draw do
  get 'lists/new'
  get 'top' => 'homes#top'
  resources :lists
end
