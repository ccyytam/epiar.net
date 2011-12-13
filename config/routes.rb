EpiarNet::Application.routes.draw do
  resources :comments

  scope 'news/:year/:month/:day' do
    resources :articles, :path => ""
  end
  
  resources :users
  
  get "news", :controller => "articles", :action => "index"

  get "download", :controller => "site"
  get "screenshots", :controller => "site"
  get "contact", :controller => "site"

  root :to => "site#index"
end
