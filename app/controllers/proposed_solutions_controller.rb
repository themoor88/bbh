# frozen_string_literal: true
class ProposedSolutionsController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  # GET /proposed_solutions/new
  def new
    if current_user.role == :tech_provider
      number_of_proposed_solutions = params[:number_of_proposed_solutions].present? ? params[:number_of_proposed_solutions].to_i : 1
      @campaign = Campaign.find(params[:campaign_id])
      @proposed_solutions = []
      number_of_proposed_solutions.times do
        @proposed_solutions << current_user.proposed_solutions.new(campaign: @campaign)
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
      @proposed_solution = current_user.proposed_solutions.new(proposed_solution_params)
      @proposed_solution.campaign = Campaign.find(params[:proposed_solution][:campaign_id])

      respond_to do |format|
        if @proposed_solution.save
          format.html { redirect_to campaigns_path, notice: 'Proposed solution was successfully created.' }
        else
          format.html { render :new }
        end
      end
    elsif current_user.role == :tech_seeker
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to campaigns_path
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def proposed_solution_params
    params.require(:proposed_solution).permit(:name, :description)
  end
end
