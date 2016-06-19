# frozen_string_literal: true
class ProposedSolutionsController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  # GET /proposed_solutions/new
  def new
    if current_user.role == :tech_provider
      number_of_proposed_solutions = params[:number_of_proposed_solutions].present? ? params[:number_of_proposed_solutions].to_i : 1
      @campaign = Campaign.active.find_by(params[:campaign_id])
      @proposed_solutions = []
      number_of_proposed_solutions.times do
        @proposed_solutions << current_user.proposed_solutions.new(campaign_id: @campaign.id)
      end
    elsif current_user.role == :tech_seeker
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to campaigns_path
    end
  end
  # rubocop:enable Metrics/AbcSize

  # rubocop:disable Metrics/AbcSize
  # POST /proposed_solutions
  def create
    if current_user.role == :tech_provider
      @campaign = Campaign.active.find_by(params[:campaign_id])

      begin
        ActiveRecord::Base.transaction do
          params[:proposed_solutions].each do |proposed_solution|
            current_user.proposed_solutions.create!(proposed_solution_params(proposed_solution))
          end
        end
        respond_to do |format|
          format.html { redirect_to campaigns_path, notice: 'Proposed solution was successfully created.' }
        end
      rescue ActiveRecord::RecordInvalid => e
        flash[:error] = "Something went wrong. Please try again and fill in required fields. #{e.message}"
        redirect_to new_campaign_proposed_solution_path(@campaign)
      end

    elsif current_user.role == :tech_seeker
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to campaigns_path
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  def proposed_solution_params(params)
    params.permit(:campaign_id, :link, :attachment, :technology_description, :technology_application, :patents, :trl, :licence_available, :institution, :expectations)
  end
end
