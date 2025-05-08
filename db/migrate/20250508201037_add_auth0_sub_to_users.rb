class AddAuth0SubToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :auth0_sub, :text
    add_index :users, :auth0_sub, unique: true
  end
end
