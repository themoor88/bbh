# frozen_string_literal: true
class Dashboard::ProposedSolutionsController < ApplicationController
  before_action :set_proposed_solution, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/proposed_solutions
  def index
    @proposed_solutions = current_tech_provider.proposed_solutions
  end

  # GET /dashboard/proposed_solutions/1
  def show
  end

  # GET /dashboard/proposed_solutions/new
  def new
    @proposed_solution = current_tech_provider.proposed_solutions.new
  end

  # GET /dashboard/proposed_solutions/1/edit
  def edit
  end

  # POST /dashboard/proposed_solutions
  def create
    @proposed_solution = current_tech_provider.proposed_solutions.new(proposed_solution_params)

    respond_to do |format|
      if @proposed_solution.save
        format.html { redirect_to @proposed_solution, notice: 'Proposed solution was successfully created.' }
        format.json { render :show, status: :created, location: @proposed_solution }
      else
        format.html { render :new }
        format.json { render json: @proposed_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/proposed_solutions/1
  def update
    respond_to do |format|
      if @proposed_solution.update(proposed_solution_params)
        format.html { redirect_to @proposed_solution, notice: 'Proposed solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposed_solution }
      else
        format.html { render :edit }
        format.json { render json: @proposed_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/proposed_solutions/1
  def destroy
    @proposed_solution.destroy
    respond_to do |format|
      format.html { redirect_to proposed_solutions_url, notice: 'Proposed solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proposed_solution
    @proposed_solution = current_tech_provider.proposed_solutions.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def proposed_solution_params
    params.require(:proposed_solution).permit(:name, :description)
  end
end
