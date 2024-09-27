class ReviewsController < ApplicationController
  before_action :set_list, only: [ :new, :create, :destroy ]
  def new
    @review=Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list



    Rails.logger.debug "Review Params: #{review_params.inspect}"
    Rails.logger.debug "Review: #{@review.inspect}"


    if @review.save
      Rails.logger.debug "Review saved successfully."

      redirect_to list_path(@list), notice: "Review created successfully."
    else
      Rails.logger.debug @review.errors.full_messages

      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@list), notice: "Deleted successfully"
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
