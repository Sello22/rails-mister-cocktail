class ReviewsController < ApplicationController
	def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render 'reviews/new'
    end
  end

  def destroy
    @review = Cocktail.find(params[:id])
    @review.destroy
    redirect_to :root
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
