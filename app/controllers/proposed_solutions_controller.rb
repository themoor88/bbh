# frozen_string_literal: true
class ProposedSolutionsController < ApplicationController
  before_action :set_proposed_solution, only: [:show, :edit, :update, :destroy]

  # GET /proposed_solutions
  def index
    @proposed_solutions = ProposedSolution.all
  end

  # GET /proposed_solutions/1
  def show
  end

  # GET /proposed_solutions/new
  def new
    @proposed_solution = ProposedSolution.new
  end

  # GET /proposed_solutions/1/edit
  def edit
  end

  # POST /proposed_solutions
  def create
    @proposed_solution = ProposedSolution.new(proposed_solution_params)

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

  # PATCH/PUT /proposed_solutions/1
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

  # DELETE /proposed_solutions/1
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
    @proposed_solution = ProposedSolution.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def proposed_solution_params
    params.require(:proposed_solution).permit(:name, :description, :state)
  end
end
