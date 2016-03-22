class ServicesController < ApplicationController

  layout 'site'
  def index
  end

  def overview
  end

  def business_plans
    @sample_business_plans = SampleBusinessPlan.where(checked: true)

    @limit_23 = @sample_business_plans[0,24]
    @limit_47 = @sample_business_plans[24,48] 
    @limit_69 = @sample_business_plans[48,72]
  end

  def entrepreneurship
  end

  def project_management
    @engineering_mgmts = EngineeringMgmt.all
  end

  def engineering_designs
    @design_engineerings = DesignEngineering.all
  end

  def financial_management
    @business_managements = BusinessManagement.all
  end

  def solar_energy_consulting
    @solar_panels = SolarPanel.all
  end

  def business_modeling
  end

  def business_development
  end
end
