class ServicesController < ApplicationController

  layout 'site'
  def index
  end

  def overview
  end

  def business_plans
    @sample_business_plans = SampleBusinessPlan.all
  end

  def entrepreneurship
  end

  def project_management
  end

  def engineering_designs
  end

  def financial_management
  end

  def solar_energy_consulting
  end

  def business_modeling
  end
end
