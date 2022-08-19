class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params) 
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
    # redirect_to list_path(@bookmark.list), status: :see_other
  end

  def show
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end


  def bookmark_params
    params.require(:bookmark).permit(:list_id, :movie_id, :comment)
  end

end
