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
