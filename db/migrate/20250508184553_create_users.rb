class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.text :username

      t.timestamps
    end
  end
end
