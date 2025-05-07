class AddAlbumToArtists < ActiveRecord::Migration[8.0]
  def change
    add_reference :artists, :album, null: false, foreign_key: true
  end
end
