class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :albums do |t|
      t.text :title
      t.text :image_url

      t.timestamps
    end
  end
end
