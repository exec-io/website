ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          para link_to('Update Posts from Translations', translate_admin_posts_path)
        end
      end

      column do
        panel "Recent Posts" do
          ul do
            Post.recent.map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end

      column do
        panel "Posts Stats" do
          ul do
            Post.group(:locale).count.each_pair do |locale, count|
              li "#{locale}: #{count}"
            end
          end
        end
      end
    end
  end # content
end
