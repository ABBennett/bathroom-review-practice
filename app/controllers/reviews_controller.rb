class ReviewsController < ApplicationController
  def new
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review = Review.new
  end

  def create
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review = Review.new(review_params)
    @review.bathroom = @bathroom

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to bathroom_path(@bathroom)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end


  private
  def review_params
    params.require(:review).permit(:rating, :body, :bathroom_id)
  end
end
