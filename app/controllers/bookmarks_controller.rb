class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  # new_list_bookmark GET  /lists/:list_id/bookmarks/new
  def new
    # we need @list
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # list_bookmarks POST /lists/:list_id/bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save

    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
