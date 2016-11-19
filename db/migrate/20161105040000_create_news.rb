class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.text :url, :null => false
      t.text :message_en, :null => false
      t.text :message_ja, :null => false
      t.date :date, :null => false

      t.timestamps
    end
  end
end
