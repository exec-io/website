class Post
  include ActiveModel::Model
  include ActiveModel::Naming
  include ActiveModel::Validations

  I18n.backend.send(:init_translations)
  @@locales = I18n.backend.send(:translations).keys
  @@posts = {}

  def initialize(hash)
    @id          = hash[:id]
    @title       = hash[:title]
    @body_html   = hash[:body_html]
    @created_at  = hash[:created_at]
    @author_name = hash[:author_name]
  end

  attr_accessor :id, :title, :body_html, :author_name, :created_at

  def self.latest(locale)
    sorted_posts(locale).last
  end

  def self.sorted_posts(locale)
    posts(locale).sort { |a,b| b.created_at <=> a.created_at }
  end

  def self.posts(locale)
    @@posts[locale] ||= begin
      posts = I18n.backend.send(:translations)[locale.to_sym][:posts]
      posts.map { |post_hash| Post.new(hash_from_post_hash(post_hash)) }
    end
  end

  def self.hash_from_post_hash(post_hash)
    { :id => post_hash.first.to_s.to_i,
      :title => post_hash.last[:title],
      :body_html => post_hash.last[:body_html],
      :created_at => post_hash.last[:created_at],
      :author_name => post_hash.last[:author_name] }
  end

end