EpiarNet::Application.routes.draw do
  scope 'news/:year/:month/:day' do
    resources :news, :path => ""
  end

  get "site/index"
  get "site/archive"
  get "site/download"
  get "site/contact"

  root :to => "site#index"
end
