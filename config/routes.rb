NewNettiaika::Application.routes.draw do
  #faye_server '/faye', timeout: 25
  #get '/chat', to: RealtimeChatController

  namespace :admin do
    resources :users, :settings, :footer_pages, :contacts, :languages, :email_templates, :companies, :company_admins, :payment_types
    get '/company/languages' => 'companies#language_list'
    get '/company/languages' => 'companies#language_list' , as: :language_list
    get '/company/:id/edit_language' => 'companies#edit_language', as: :edit_language
    match '/company/:id/update_language' => 'companies#update_language', as: :update_language , via: [:put, :post]

  end

  resources :user_sessions

  get 'logout' => 'user_sessions#destroy', :as => :logout
  get 'login' => 'user_sessions#new', :as => :login
  match 'signup(/:registration_key)' => 'user_sessions#signup', :as => :signup, via: [:get, :post, :patch]

  match '/forgot_password' => 'fronts#forgot_password', :as => :forgot_password, via: [:get, :post]
  match '/change_password' => 'fronts#change_password', :as => :change_password, via: [:get, :post, :patch]
  get 'dashboard' => 'fronts#dashboard', :as => :dashboard
  match 'activate/:activation_key' => 'fronts#user_activation', :as => :activation_link, via: [:get]
  match '/profile' => 'fronts#profile', :as => :profile, via: [:get, :post, :patch]
  get '/show_search_box/:toggle/:model/:pm' => 'fronts#show_search_box', :as => :show_search_box
  match 'contact_us' => 'fronts#contact_us', :as => :contact_us, via: [:get, :post, :patch]
  get '/other/:page_id' => 'fronts#other', :as => :other

  # You can have the root of your site routed with "root"
  root 'fronts#dashboard'

end
