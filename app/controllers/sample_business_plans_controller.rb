class SampleBusinessPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :only_allow_admins
  before_action :set_sample_business_plan, only: [:show, :edit, :update, :destroy]

  layout 'adminpanel_tables'
  def index
    @sample_business_plans = SampleBusinessPlan.all
  end

  # GET /course_types/1
  # GET /course_types/1.json
  def show
  end

  # GET /course_types/new
  # GET /course_types/new.json
  def new
    @sample_business_plan = SampleBusinessPlan.new
  end

  # GET /course_types/1/edit
  def edit
  end

  # POST /course_types
  # POST /course_types.json
  def create
    @sample_business_plan = SampleBusinessPlan.new(sample_business_plan_params)

    respond_to do |format|
      if @sample_business_plan.save
        format.html { redirect_to  @sample_business_plan, notice: 'Faculty was successfully created.' }
        format.json { render json: @sample_business_plan, status: :created, location: @sample_business_plan }
      else
        format.html { render :new }
        format.json { render json: @sample_business_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_types/1
  # PUT /course_types/1.json
  def update
    respond_to do |format|
      if @sample_business_plan.update(sample_business_plan_params)
        format.html { redirect_to @sample_business_plan, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample_business_plan }
      else
        format.html { render :edit }
        format.json { render json: @sample_business_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_types/1
  # DELETE /course_types/1.json
  def destroy
    @sample_business_plan.destroy
    respond_to do |format|
      format.html { redirect_to sample_business_plans_url, notice: 'Business Plan was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def import
    SampleBusinessPlan.import(params[:file])
    redirect_to sample_business_plans_url, notice: "Business Plans imported."
    @sample_business_plans = SampleBusinessPlan.all
  end

  private

  def only_allow_admins
    redirect_to root_path, :alert => 'Not authorized as an superadministrator.' unless current_user.has_role? :superadmin or current_user.has_role? :admin_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_sample_business_plan
    @sample_business_plan = SampleBusinessPlan.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sample_business_plan_params
    params.require(:sample_business_plan).permit(:checked, :image, :title)
  end

end
