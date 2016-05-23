# frozen_string_literal: true
class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]

  # GET /campaigns
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  def show
    @existing_proposed_solution = current_tech_provider.proposed_solutions.where(campaign: @campaign)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
