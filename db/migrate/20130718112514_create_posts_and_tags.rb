class CreatePostsAndTags < ActiveRecord::Migration
  def change
    create_table :posts do |t| 
      t.string :title, null: false
      t.string :author, null: false
      t.text   :content, null: false
      t.timestamps
    end

    create_table :tags do |t| 
      t.string :name, null: false, uniqueness: true
      t.timestamps
    end

    create_table :posts_tags do |t| 
      t.belongs_to :post
      t.belongs_to :tag
    end
  end
end
