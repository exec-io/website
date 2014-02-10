ActiveAdmin.register Post do

  collection_action :translate, :method => :get do
    Post.update_posts
    flash[:notice] = 'Post translations updated from file system'
    redirect_to admin_dashboard_path
  end

  permit_params :title, :body_html, :author_name

  index do
    column :id
    column :title
    column :locale
    column :author_name
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Blog Post" do
      f.input :title
      f.input :author_name
      f.input :body_html
    end
    f.actions
  end

  controller do

    def create
      create! do |success, failure|
        success.html {
          @post.publish_to_translation_system!
          flash[:notice] = 'Post was updated and published to LocaleApp'
          redirect_to admin_posts_path
        }
      end
    end

    def update
      update! do |success, failure|
        success.html {
          @post.publish_to_translation_system!
          flash[:notice] = 'Post was updated and published to LocaleApp'
          redirect_to admin_posts_path
        }
      end
    end
  end

end
