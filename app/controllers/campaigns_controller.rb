# frozen_string_literal: true
class CampaignsController < ApplicationController
  # GET /campaigns
  def index
    @slider_items = SliderItem.active
    if current_user.role == :tech_provider
      @campaigns = Campaign.active
    elsif current_user.role == :tech_seeker
      @campaigns = current_user.campaigns.not_deleted
    end
  end

  # GET /campaigns/1
  def show
    if current_user.role == :tech_provider
      @campaign = Campaign.not_deleted.find(params[:id])
    elsif current_user.role == :tech_seeker
      @campaign = current_user.campaigns.not_deleted.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Something went wrong. This campaign might have been deleted by the administrator.'
    redirect_to campaigns_path
  end
end
