class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
    end

    create_table :roles_users, id: false do |t|
      t.integer :user_id
      t.integer :role_id
      t.index :role_id
      t.index [:user_id, :role_id], unique: true
    end
  end
end
