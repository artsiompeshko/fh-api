class CompetitorsController < ApplicationController
  before_action :set_competitor, only: [:show, :update, :delete]

  # GET /competitors
  def index
    @competitors = Competitor.all

    render json: @competitors
  end

  # GET /competitors/1
  def show
    render json: @competitor
  end

  # POST /competitors
  def create
    @competitor = Competitor.new(competitor_params)

    if @competitor.save
      render json: @competitor, status: :created
    else
      render json: @competitor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /competitors/1
  def update
    if @competitor.update(competitor_params)
      render json: @competitor
    else
      render json: @competitor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /competitors/1
  def delete
    @competitor.destroy
    render json: {deleted: true}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor
      @competitor = Competitor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def competitor_params
      params.require(:competitor).permit(:name, :similar_names, :ligue_id)
    end
end
