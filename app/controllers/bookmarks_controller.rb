class BookmarksController < ApplicationController
  # We need to find the restaurant associated with the review
  # before_action :set_list, only: %i[new create]

  # new_list_bookmark GET  /lists/:list_id/bookmarks/new
  def new
    # we need @list in our `simple_form_for`
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # list_bookmarks POST /lists/:list_id/bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  # def set_list
  #   @list = List.find(params[:list_id])
  # end

  # DELETE bookmarks/:id
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
