class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :type
      t.string :state
      t.integer :user_id
      t.text :text
      t.text :file_path
      t.timestamps
    end
    add_index :items, :user_id
  end
end
