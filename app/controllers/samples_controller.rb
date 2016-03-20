class SamplesController < ApplicationController
  before_action :set_business_plan

  layout 'site'
  def show
  end

  private

  def set_business_plan
    @sample_business_plan = SampleBusinessPlan.find_by_id(params[:id])
    
    @sections = @sample_business_plan.sections.all
    @topics = @sample_business_plan.topics.all
    
  end

end
