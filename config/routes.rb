EpiarNet::Application.routes.draw do
  resources :news
  match 'news/:year/:month/:day/:slug', :controller => :news, :action => :show

  get "site/index"
  get "site/archive"
  get "site/download"
  get "site/contact"

  root :to => "site#index"
end
