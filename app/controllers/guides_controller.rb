class GuidesController < ApplicationController
  include GuidesSearch

  # GET /guides
  # GET /guides.json
  def index
    @guides = search(guides_search_params)
  end

  def show
    @guide = Guide.find(params[:id])
    @review = Review.new
  end

  private

  def guides_search_params
    return {} if params[:guides_search_form].blank?
    params.require(:guides_search_form).permit(:language, :activity)
  end
end
