class LiguesController < ApplicationController
  before_action :set_ligue, only: [:show, :update, :delete]

  # GET /ligues
  def index
    @ligues = Ligue.all

    render json: @ligues
  end

  # GET /ligues/1
  def show
    render json: @ligue
  end

  # POST /ligues
  def create
    @ligue = Ligue.new(ligue_params)

    if @ligue.save
      render json: @ligue, status: :created
    else
      render json: @ligue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ligues/1
  def update
    if @ligue.update(ligue_params)
      render json: @ligue
    else
      render json: @ligue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ligues/1
  def delete
    @ligue.destroy
    render json: {deleted: true}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ligue
      @ligue = Ligue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ligue_params
      params.require(:ligue).permit(:name)
    end
end
