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
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def list_parmas
    params.require(:list).permit(:name)
  end
end
