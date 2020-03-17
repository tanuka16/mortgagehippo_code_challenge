Rails.application.routes.draw do
  resources :coins, except: [:new, :edit]
  resources :users
  resources :transactions
  # resources :admin

  get 'coins/sum' => "coins#sum"
  get 'transactions/user_trans' => "transactions#user_trans"
  post '/transactions/user_deposit' => "transactions#user_deposit"
  post '/transactions/user_withdrawal' => "transactions#user_withdrawal"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
