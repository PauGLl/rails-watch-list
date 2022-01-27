class ListsController < ApplicationController
  before_action :find_list, only: [:show, :movies, :destroy]
  before_action :bookmarks, only: [:show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @reviews = @list.reviews
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def bookmarks
    @bookmarks = @list.bookmarks
  end

  def destroy
    @list.destroy

    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :bgimage)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
