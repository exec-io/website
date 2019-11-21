ExecIo::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  scope "(:locale)", :locale => /en|de|es|fr|it|hu|ja|ru|zh-TW|he|sk|sv/ do
    #root :to => 'welcome#show'
    get '/blog' => 'blog#index', :as => :blog
  end

end
