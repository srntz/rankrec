class AlbumsController < ApplicationController
  include WithAuthenticatedUser
  def index
  end

  def search
    @albums = Album.where("title ILIKE ?", "%#{params[:album_title]}%")
    puts @albums
    render partial: "load_data", locals: {albums: @albums}
  end

  def load_data
    @albums = Album.order(created_at: :desc).first(10)
    render partial: "load_data", locals: {albums: @albums}
  end
end
