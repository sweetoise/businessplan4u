class ServicesController < ApplicationController

  layout 'site'
  def index
  end

  def overview
  end

  def business_plans
    @sample_business_plans = SampleBusinessPlan.where(checked: true)

    @limit_23 = @sample_business_plans[0,20]
    @limit_47 = @sample_business_plans[21,31] 
    @limit_69 = @sample_business_plans[31,60]
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
