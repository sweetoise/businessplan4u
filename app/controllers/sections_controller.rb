class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_section, only: [:show, :edit, :update, :destroy, :import]
  before_action :list_all_resources

  layout 'adminpanel_tables'
  def index
    @sections = Section.all
  end

  def show
  end

  def edit
    @sample_business_plans = SampleBusinessPlan.all
  end

  def new
    @section = Section.new
    @sample_business_plans = SampleBusinessPlan.all
  end

  def create
    @section = Section.new(section_params)
    respond_to do |format|
      if @section.save(context: :not_import)
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def import
    Section.import(params[:file], params[:sample_business_plan_id])
    redirect_to sections_url, notice: "Sections imported."
    @sections = Section.all
  end

  private

  def list_all_resources
    @sample_business_plans = SampleBusinessPlan.all
    @sections = Section.all
    @topics = Topic.all
  end

  def check_voucher_admin_and_superadmin
    if current_user.has_role? :superadmin or current_user.has_role? :admin_user
      else
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.

  def set_section
    @section = Section.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def section_params
    params.require(:section).permit(:name, :sample_business_plan_id)
  end

end
