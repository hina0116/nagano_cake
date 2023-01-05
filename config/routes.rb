Rails.application.routes.draw do

  namespace :public do
    get 'items/index'
    get 'items/show'
  end

  namespace :admin do
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
