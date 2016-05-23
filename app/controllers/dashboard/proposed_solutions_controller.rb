# frozen_string_literal: true
class Dashboard::ProposedSolutionsController < ApplicationController
  # before_action :set_proposed_solution, only: [:show]

  # GET /dashboard/proposed_solutions
  # def index
  #   @proposed_solutions = current_tech_provider.proposed_solutions
  # end

  # GET /dashboard/proposed_solutions/1
  # def show
  # end

  # GET /dashboard/proposed_solutions/new
  def new
    @proposed_solution = current_tech_provider.proposed_solutions.new
  end

  # POST /dashboard/proposed_solutions
  def create
    @proposed_solution = current_tech_provider.proposed_solutions.new(proposed_solution_params)

    respond_to do |format|
      if @proposed_solution.save
        format.html { redirect_to dashboard_proposed_solutions_path, notice: 'Proposed solution was successfully created.' }
        format.json { render :show, status: :created, location: @proposed_solution }
      else
        format.html { render :new }
        format.json { render json: @proposed_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_proposed_solution
  #   @proposed_solution = current_tech_provider.proposed_solutions.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def proposed_solution_params
    params.require(:proposed_solution).permit(:name, :description)
  end
end
