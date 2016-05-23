# frozen_string_literal: true
class Dashboard::ProposedSolutionsController < ApplicationController
  # GET /dashboard/proposed_solutions/new
  def new
    @proposed_solution = current_tech_provider.proposed_solutions.new
    @campaign = Campaign.find(params[:campaign_id])
    render layout: false
  end

  # POST /dashboard/proposed_solutions
  def create
    @proposed_solution = current_tech_provider.proposed_solutions.new(proposed_solution_params)
    @proposed_solution.campaign = Campaign.find(params[:proposed_solution][:campaign_id])

    respond_to do |format|
      if @proposed_solution.save
        format.html { redirect_to campaigns_path, notice: 'Proposed solution was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def proposed_solution_params
    params.require(:proposed_solution).permit(:name, :description)
  end
end
