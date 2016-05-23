# frozen_string_literal: true
class Dashboard::CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/campaigns
  def index
    @campaigns = current_tech_seeker.campaigns
  end

  # GET /dashboard/campaigns/1
  def show
  end

  # GET /dashboard/campaigns/new
  def new
    @campaign = current_tech_seeker.campaigns.new
  end

  # GET /dashboard/campaigns/1/edit
  def edit
  end

  # POST /dashboard/campaigns
  def create
    @campaign = current_tech_seeker.campaigns.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/campaigns/1
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/campaigns/1
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = current_tech_seeker.campaigns.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def campaign_params
    params.require(:campaign).permit(:name, :description, :expires_at)
  end
end
