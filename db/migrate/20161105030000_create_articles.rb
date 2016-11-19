class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :slug, :null => false
      t.boolean :draft, :null => false, :default => false
      t.integer :order, :null => false, :default => 0
      t.string :title_en, :null => false
      t.string :title_ja, :null => false
      t.text :image_url, :null => false
      t.text :content_en, :null => false
      t.text :content_ja, :null => false
      t.text :comment, :null => false
      t.belongs_to :category

      t.index :slug, unique: true
      t.timestamps
    end
  end
end
