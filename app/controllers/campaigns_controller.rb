# frozen_string_literal: true
class CampaignsController < ApplicationController
  after_action :track_action, only: [:show]

  # GET /campaigns
  def index
    @slider_items = SliderItem.active
    if current_user.role == :tech_provider
      @campaigns = Campaign.active
    elsif current_user.role == :tech_seeker || current_user.role == :consultant
      @campaigns = current_user.campaigns.not_deleted
    end
  end

  # rubocop:disable Metrics/AbcSize
  # GET /campaigns/1
  def show
    if current_user.role == :tech_provider
      @campaign = Campaign.not_deleted.find(params[:id])
      @proposed_solutions = current_user.proposed_solutions.where(campaign_id: @campaign.id)
    elsif current_user.role == :tech_seeker || current_user.role == :consultant
      @campaign = current_user.campaigns.not_deleted.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Something went wrong. This campaign might have been deleted by the administrator.'
    redirect_to campaigns_path
  end
  # rubocop:enable Metrics/AbcSize

  def performance
    @campaign = current_user.campaigns.not_deleted.find(params[:id])
    @favorites_count = @campaign.likes.count
    @proposed_solutions_count = @campaign.proposed_solutions.count
    @campaign_views_count = Ahoy::Event.all.map { |event| event.properties['id'] }.count(@campaign.id.to_s)
  end

  protected

  def track_action
    ahoy.track "Processed #{controller_name}##{action_name}", request.filtered_parameters
  end
end
