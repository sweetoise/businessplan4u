class SolarPanelsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_solar_panel, only: [:show, :edit, :update, :destroy]
  # GET /solar_panels
  # GET /solar_panels.json
  layout 'adminpanel_tables'
  def index
    @solar_panels = SolarPanel.all
  end

  # GET /solar_panels/1
  # GET /solar_panels/1.json
  def show
  end

  # GET /solar_panels/new
  def new
    @solar_panel = SolarPanel.new
  end

  # GET /solar_panels/1/edit
  def edit
  end

  # POST /solar_panels
  # POST /solar_panels.json
  def create
    @solar_panel = SolarPanel.new(solar_panel_params)

    respond_to do |format|
      if @solar_panel.save
        format.html { redirect_to @solar_panel, notice: 'Solar panel was successfully created.' }
        format.json { render :show, status: :created, location: @solar_panel }
      else
        format.html { render :new }
        format.json { render json: @solar_panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solar_panels/1
  # PATCH/PUT /solar_panels/1.json
  def update
    respond_to do |format|
      if @solar_panel.update(solar_panel_params)
        format.html { redirect_to @solar_panel, notice: 'Solar panel was successfully updated.' }
        format.json { render :show, status: :ok, location: @solar_panel }
      else
        format.html { render :edit }
        format.json { render json: @solar_panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solar_panels/1
  # DELETE /solar_panels/1.json
  def destroy
    @solar_panel.destroy
    respond_to do |format|
      format.html { redirect_to solar_panels_url, notice: 'Solar panel was successfully destroyed.' }
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
  def set_solar_panel
    @solar_panel = SolarPanel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def solar_panel_params
    params.require(:solar_panel).permit(:title, :description)
  end
end
