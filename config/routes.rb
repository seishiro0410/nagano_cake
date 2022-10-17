Rails.application.routes.draw do





# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}




  scope module: :public do
    get 'homes/top'
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    get 'customers/mypage' => 'customers#show', as: 'customers/mypage'
    get 'customers/mypage/edit' => 'customers#edit', as: 'customers/mypage/edit'
    patch 'customers/mypage' => 'customers#update', as: 'customer_update'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get 'orders/thanx'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/information'
  end

get 'admin/' => 'admin/homes#top', as: 'admin'
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
