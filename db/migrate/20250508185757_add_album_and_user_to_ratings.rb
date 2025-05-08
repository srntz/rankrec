class AddAlbumAndUserToRatings < ActiveRecord::Migration[8.0]
  def change
    add_reference :ratings, :user, null: false, foreign_key: true
    add_reference :ratings, :album, null: false, foreign_key: true
  end
end
