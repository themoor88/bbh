class Dashboard::FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  # GET /dashboard/favorites
  def index
    @favorites = Like.all
  end

  # POST /dashboard/favorites
  def create
    @favorite = Like.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/favorites/1
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Like.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def favorite_params
    params.fetch(:dashboard_favorite, {})
  end
end
