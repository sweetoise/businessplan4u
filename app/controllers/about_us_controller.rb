class AboutUsController < ApplicationController

  layout 'site'
  def index
    @sample_business_plans = SampleBusinessPlan.all
  end
end
