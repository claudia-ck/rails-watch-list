class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create, :destroy ]
  def new
    @bookmark=Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save  # Save returns false if validation fails
    redirect_to list_path(@list), notice: "Bookmark created successfully"
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
    redirect_to list_path(@list), notice: "Deleted successfully"
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
