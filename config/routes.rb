ExecIo::Application.routes.draw do

  scope "(:locale)", :locale => /en|de|es|fr|it|hu|ja|ru|zh-TW|he|sk|sv/ do
    get '/' => 'welcome#show'
    get '/blog' => 'blog#index', :as => :blog
  end

  root :to => 'welcome#show'

end
