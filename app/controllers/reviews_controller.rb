class ReviewsController < ApplicationController

  def create
    @review = Review.create(create_new_review_data)
    respond_to do |format|
      if @review.valid?
        format.html { redirect_to guide_path(@review.guide.id)}
        format.js {flash.now[:notice] = "New review was created successfully." }
      else
        format.html { redirect_to guide_path(create_new_review_data[:guide_id]), notice: @review.errors }
        format.js {flash.now[:notice] = @review.errors.to_json }
      end
    end
  end

  def destroy
    @review = set_review
    @deleted_id = @review.id
    @review.destroy
    respond_to do |format|
      format.html { redirect_to guide_path(params[:guide_id]), notice: 'Review was successfully deleted.' }
      # format.json { head :no_content }
      format.js {flash.now[:notice] = "Review was successfully deleted." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  def create_new_review_data
    # params.require(:create_new_review_data).permit(:score, :comment, :guide_id)
    params.require(:review).permit(:score, :comment, :guide_id)
  end
end
