class AssigneesController < ApplicationController
  before_action :set_assignee, only: [:show, :edit, :update, :destroy]

  # GET /assignees
  # GET /assignees.json
  def index
    @assignees = Assignee.all
  end

  # GET /assignees/1
  # GET /assignees/1.json
  def show
  end

  # GET /assignees/new
  def new
    @assignee = Assignee.new
  end

  # GET /assignees/1/edit
  def edit
  end

  # POST /assignees
  # POST /assignees.json
  def create
    @assignee = Assignee.new(assignee_params)
    if @assignee.save
      redirect_to to_dos_path
    end
  end

  # PATCH/PUT /assignees/1
  # PATCH/PUT /assignees/1.json
  def update
    if @assignee.update(assignee_params)
      redirect_to to_dos_path
    end
  end

  # DELETE /assignees/1
  # DELETE /assignees/1.json
  def destroy
    @assignee.destroy
    respond_to do |format|
      format.html { redirect_to assignees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignee
      @assignee = Assignee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignee_params
      params.require(:assignee).permit(:assignee_name)
    end
end
