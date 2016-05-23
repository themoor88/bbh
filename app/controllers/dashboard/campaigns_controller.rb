# frozen_string_literal: true
class Dashboard::CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]

  # GET /dashboard/campaigns
  def index
    @campaigns = current_tech_seeker.campaigns
  end

  # GET /dashboard/campaigns/1
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = current_tech_seeker.campaigns.find(params[:id])
  end
end
