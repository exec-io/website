ExecIo::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  scope "(:locale)", :locale => /en|de|es|fr|it|hu|ja|ru|zh-TW|he|sk|sv/ do
    root :to => 'welcome#show'
    get '/blog' => 'blog#index', :as => :blog
    get '/about_us' => 'about_us#show', :as => :about_us
    get '/prosperity_planner' => 'prosperity_planner#show', :as => :prosperity_planner
    get '/locations' => 'locations#show', :as => :locations
    get '/contact' => 'contact#show', :as => :contact
  end

end
