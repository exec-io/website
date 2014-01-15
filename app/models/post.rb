class Post < ActiveRecord::Base

  validates :title, :body_html, :author_name, :locale, :presence => true

  def publish_to_translation_system!
    [:title, :body_html, :author_name, :created_at, :updated_at].each do |key|
      TranslationSystem.create!(locale, "posts.#{id}", key, send(key))
    end
  end

  def self.update_posts
    I18n.backend.send(:init_translations)
    locales = I18n.backend.send(:translations).keys
    locales.each do |locale|
      post_attributes = find_translations(locale)
      post_attributes.each do |attributes|
        post = Post.where(:id => attributes[:id], :locale => locale).first
        if post.present?
          post.attributes = attributes
        else
          post = Post.new(attributes)
        end
        post.save
      end
    end
  end

  def self.recent
    ordered('en').limit(5)
  end

  def self.latest(locale)
    ordered(locale).first
  end

  def self.ordered(locale)
    where(:locale => locale).order('created_at DESC')
  end

  def self.find_translations(locale)
    posts = I18n.backend.send(:translations)[locale.to_sym][:posts]
    if posts.present?
      posts.map { |translation| hash_from_translation(locale, translation) }
    else
      []
    end
  end

  def self.hash_from_translation(locale, translation)
    { :id => translation.first.to_s.to_i,
      :locale => locale.to_s,
      :title => translation.last[:title],
      :body_html => translation.last[:body_html],
      :created_at => translation.last[:created_at],
      :author_name => translation.last[:author_name] }
  end

end