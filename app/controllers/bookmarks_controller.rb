class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:edit, :update, :destroy]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def update
    @bookmark.update(bookmark_params)
    redirect_to list_path(@bookmark.list_id)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
