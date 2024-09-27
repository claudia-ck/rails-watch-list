class ListsController < ApplicationController
  # create a new blank list and link to new.html.erb
  def index
    @lists=List.all
  end

  def new
    @list=List.new
  end

  def show
    @list=List.find(params[:id])
  end

  # save the form input and set the prviate params
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: "list successfully created."
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
