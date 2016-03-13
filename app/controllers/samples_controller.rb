class SamplesController < ApplicationController
  before_action :set_business_plan

  layout 'site'
  def show
  end

  private

  def set_business_plan
    @sample_business_plan = SampleBusinessPlan.find_by_id(params[:id])
  end

end
