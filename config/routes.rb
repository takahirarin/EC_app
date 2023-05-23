Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      namespace :admin do
        get '/', to: 'homes#top', as: 'top'
        get '/search', to: 'search#search', as: 'search'
        resources :customers, :only => [:index]
        resources :genres, :only => [:index, :create, :edit, :update]
        resources :items
        resources :orders, :only => [:show, :update] do
          resources :order_details, :only => [:update]
        end
      end

       scope module: :public do
        root to: 'homes#top'
        get '/end_users', to: 'end_users#show', as: 'mypage'
        get '/end_user/edit', to: 'end_users#edit', as: 'edit_end_user'
        patch '/end_users', to: 'end_users#update', as: 'end_user'
        get '/end_users/confirm', to: 'end_users#confirm', as: 'confirm_end_user'
        patch 'end_users/withdraw', to: 'end_users#withdraw', as: 'withdraw_end_user'
        resources :items, :only => [:index, :show]
        delete '/cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'cart_item_destroy_all'
        resources :cart_items
        post 'orders/confirm', to: "orders#confirm", as: 'confirm'
        get 'orders/done', to: 'orders#done', as: 'done'
        resources :orders, :only => [:new, :create, :index, :show]
        resources :addresses,:only => [:index, :create, :update, :edit, :destroy]
        get 'search/:id', to: 'search#search', as: 'search'


      end



      devise_for :end_users, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations'
      }

      devise_for :admin, controllers: {
        sessions: 'admin/sessions'
      }


end
