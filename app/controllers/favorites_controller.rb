# frozen_string_literal: true
class FavoritesController < ApplicationController

  # GET /favorites
  def index
    @favorites = current_user.likes.map(&:campaign)
  end

  def add_to_favorites
    campaign = Campaign.find(params[:campaign_id])
    previous_favorites = current_user.likes.where(campaign_id: campaign.id)
    favorite = current_user.likes.new(campaign_id: campaign.id)

    respond_to do |format|
      if !previous_favorites.present? && favorite.save
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false } }
      end
    end
  end

  def remove_from_favorites
    campaign = Campaign.find(params[:campaign_id])
    favorite = current_user.likes.where(campaign_id: campaign.id).first

    respond_to do |format|
      if favorite.present? && favorite.destroy
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false } }
      end
    end
  end
end
