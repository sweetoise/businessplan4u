class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :list_all_resources
  
  
  def index
  end
  
  def show
  end

  def update_sections
    # updates artists and songs based on genre selected
    sample_business_plan = SampleBusinessPlan.find(params[:sample_business_plan_id])
    # map to name and id for use in our options_for_select
    @sections = sample_business_plan.sections.map{|a| [a.name, a.id]}.insert(0, "Select Section")
    @topics = sample_business_plan.topics.map{|s| [s.title, s.id]}.insert(0, "Select Topic")
  end

  def update_topics
    section = Section.find(params[:section_id])
    @topics = section.topics.map{|s| [s.title, s.id]}.insert(0, "Select Topic")
  end

  private

  def list_all_resources
    @sections = Section.all
    @topics = Topic.all
  end

end