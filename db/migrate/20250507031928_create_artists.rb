class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists do |t|
      t.text :name

      t.timestamps
    end
  end
end
