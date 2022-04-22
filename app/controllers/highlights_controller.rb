class HighlightsController < ApplicationController
  before_action :set_highlight, only: [:show, :update, :delete]

  # GET /highlights
  def index
    @highlights = Highlight.all

    render json: @highlights
  end

  # GET /highlights/1
  def show
    render json: @highlight
  end

  # POST /highlights
  def create
    @highlight = Highlight.new(highlight_params)

    if @highlight.save
      render json: @highlight, status: :created
    else
      render json: @highlight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /highlights/1
  def update
    if @highlight.update(highlight_params)
      render json: @highlight
    else
      render json: @highlight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /highlights/1
  def delete
    @highlight.destroy
    render json: {deleted: true}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highlight
      @highlight = Highlight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def highlight_params
      params.require(:highlight).permit(:competitor_1, :references, :competitor_2_id, :source_id, :link, :external_id, :datetime)
    end
end
