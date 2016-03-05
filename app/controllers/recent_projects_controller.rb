class RecentProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recent_project, only: [:show, :edit, :update, :destroy]
  before_action :check_voucher_admin_and_superadmin
  # GET /recent_projects
  # GET /recent_projects.json

  layout 'adminpanel_tables'
  def index
    @recent_projects = RecentProject.all
  end

  # GET /recent_projects/1
  # GET /recent_projects/1.json
  def show
  end

  # GET /recent_projects/new
  def new
    @recent_project = RecentProject.new
  end

  # GET /recent_projects/1/edit
  def edit
  end

  # POST /recent_projects
  # POST /recent_projects.json
  def create
    @recent_project = RecentProject.new(recent_project_params)

    respond_to do |format|
      if @recent_project.save
        format.html { redirect_to @recent_project, notice: 'Recent project was successfully created.' }
        format.json { render :show, status: :created, location: @recent_project }
      else
        format.html { render :new }
        format.json { render json: @recent_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recent_projects/1
  # PATCH/PUT /recent_projects/1.json
  def update
    respond_to do |format|
      if @recent_project.update(recent_project_params)
        format.html { redirect_to @recent_project, notice: 'Recent project was successfully updated.' }
        format.json { render :show, status: :ok, location: @recent_project }
      else
        format.html { render :edit }
        format.json { render json: @recent_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recent_projects/1
  # DELETE /recent_projects/1.json
  def destroy
    @recent_project.destroy
    respond_to do |format|
      format.html { redirect_to recent_projects_url, notice: 'Recent project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_voucher_admin_and_superadmin
    if current_user.has_role? :superadmin or current_user.has_role? :admin_user
      else
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recent_project
    @recent_project = RecentProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recent_project_params
    params.require(:recent_project).permit(:title, :description, :image)
  end
end
