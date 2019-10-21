Rails.application.routes.draw do
  resources :users 
  resources :trips 
  resources :posts 
  resources :comments
  resources :friends
  resources :comment_likes
  resources :post_likes
end
