# frozen_string_literal: true
class CampaignsController < ApplicationController
  # GET /campaigns
  def index
    if current_user.role == :tech_provider
      @campaigns = Campaign.all
    elsif current_user.role == :tech_seeker
      @campaigns = current_user.campaigns
    end
  end

  # GET /campaigns/1
  def show
    if current_user.role == :tech_provider
      @campaign = Campaign.find(params[:id])
    elsif current_user.role == :tech_seeker
      @campaign = current_user.campaigns.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Something went wrong. Please try again.'
    redirect_to campaigns_path
  end
end
