class AlbumsController < ApplicationController
  include WithAuthenticatedUser
  def index
  end

  def load_data
    @albums = Album.order(created_at: :desc).first(10)
  end
end
