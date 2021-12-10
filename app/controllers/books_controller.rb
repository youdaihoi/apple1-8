class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to top_path
  end

  def edit
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
