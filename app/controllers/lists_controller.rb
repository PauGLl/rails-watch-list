class ListsController < ApplicationController
  before_action :find_list, only: [:show, :movies, :edit, :update, :destroy]
  before_action :movies, only: [:show, :edit, :update]

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
  end

  def movies
    @movies = @list.movies
  end

  def edit
  end

  def update
    @list.update(list_params)

    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy

    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :movies)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
