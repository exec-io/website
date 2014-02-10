class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,       :null => false
      t.string :locale,      :null => false
      t.text   :body_html,   :null => false
      t.string :author_name, :null => false
      t.timestamps
    end
  end
end
