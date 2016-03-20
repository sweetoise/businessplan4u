class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :list_all_resources

  layout 'adminpanel_tables'
  def index
    @topics = Topic.all
  end

  def show
  end

  def edit
    @sections = Section.all
    @sample_business_plans = SampleBusinessPlan.all
  end

  def new
    @topic = Topic.new
    @sections = Section.all
    @sample_business_plans = SampleBusinessPlan.all
  end

  def create
    @topic = Topic.new(topic_params)
    respond_to do |format|
      if @topic.save(context: :not_import)
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def import
    Topic.import(params[:file], params[:sample_business_plan_id], params[:section_id])
    redirect_to topics_url, notice: "Topics imported."
    @topics = Topic.all
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

  def set_topic
    @topic = Topic.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title, :number, :section_id, :sample_business_plan_id)
  end

end
