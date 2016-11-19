class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :slug, :null => false
      t.integer :order, :null => false, :default => 0
      t.string :name_en, :null => false
      t.string :name_ja, :null => false
      t.text :image_url, :null => false
      t.text :desc_en, :null => false
      t.text :desc_ja, :null => false

      t.timestamps
    end
  end
end
