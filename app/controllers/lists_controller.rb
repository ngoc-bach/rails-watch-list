class ListsController < ApplicationController

  # lists GET  /lists
  def index
    @lists = List.all
    # render to index.html.erb
  end

  # list GET  /lists/:id
  def show
    @list = List.find(params[:id])
    # render to show.html.erb
  end

  # new_list GET  /lists/new
  def new
    @list = List.new
    # render to new.html.erb
  end

  def create
    @list = List.new(list_parmas)
    @list.save

    redirect_to list_path(@list)
  end

  private

  def list_parmas
    params.require(:list).permit(:name)
  end
end
