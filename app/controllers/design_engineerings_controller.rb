class DesignEngineeringsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_design_engineering, only: [:show, :edit, :update, :destroy]
  # GET /design_engineerings
  # GET /design_engineerings.json
  layout 'adminpanel_tables'
  def index
    @design_engineerings = DesignEngineering.all
  end

  # GET /design_engineerings/1
  # GET /design_engineerings/1.json
  def show
  end

  # GET /design_engineerings/new
  def new
    @design_engineering = DesignEngineering.new
  end

  # GET /design_engineerings/1/edit
  def edit
  end

  # POST /design_engineerings
  # POST /design_engineerings.json
  def create
    @design_engineering = DesignEngineering.new(design_engineering_params)

    respond_to do |format|
      if @design_engineering.save
        format.html { redirect_to @design_engineering, notice: 'Design engineering was successfully created.' }
        format.json { render :show, status: :created, location: @design_engineering }
      else
        format.html { render :new }
        format.json { render json: @design_engineering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /design_engineerings/1
  # PATCH/PUT /design_engineerings/1.json
  def update
    respond_to do |format|
      if @design_engineering.update(design_engineering_params)
        format.html { redirect_to @design_engineering, notice: 'Design engineering was successfully updated.' }
        format.json { render :show, status: :ok, location: @design_engineering }
      else
        format.html { render :edit }
        format.json { render json: @design_engineering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /design_engineerings/1
  # DELETE /design_engineerings/1.json
  def destroy
    @design_engineering.destroy
    respond_to do |format|
      format.html { redirect_to design_engineerings_url, notice: 'Design engineering was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_voucher_admin_and_superadmin
    if current_user.has_role? :superadmin or current_user.has_role? :admin_user
      else
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_design_engineering
    @design_engineering = DesignEngineering.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def design_engineering_params
    params.require(:design_engineering).permit(:title, :description)
  end
end
