# frozen_string_literal: true
class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  # GET /favorites
  def index
    @favorites = Like.all
  end

  # POST /favorites
  def create
    @favorite = Like.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_favorites_url, notice: 'Favorite was successfully destroyed.' }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def favorite_params
    params.fetch(:dashboard_favorite, {})
  end
end
