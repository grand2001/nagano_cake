Rails.application.routes.draw do
  #
  #URL/customers/sign_in...
  devise_for :customers,skip:[:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  #
  #URL/admin/sign_in...
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }

  namespace :admin do
   resources :orders, only: [:show, :update]

   resources :order_informations, only: [:update]

   resources :customers, only: [:index, :show, :edit, :update]

   resources :genres, only: [:index, :edit, :create, :update]

   resources :items, only: [:index, :new, :show, :edit, :create, :update]

   root to:'homes#top'
  end

  scope module: :public do
   root to:'homes#top'
   get "/about" => "homes#about"

   resources :items, only: [:index, :show]

   get 'customers/confirmation'
   patch 'customers/withdrawal'
   resources :customers, only: [:show, :edit, :update]

   delete 'cart_items/all_cancel'
   delete 'cart_items/:id' => 'cart_items#cancel', as: "cart_items_cancel"
   resources :cart_items, only: [:index, :update, :create]

   get 'orders/thanks'
   post 'orders/confirm'
   resources :orders, only: [:new, :show, :index, :create]

   resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
