class BookmarksController < ApplicationController
  def new
    @Bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(params[:list_id])
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
