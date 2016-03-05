class EngineeringMgmtsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_engineering_mgmt, only: [:show, :edit, :update, :destroy]
  # GET /engineering_mgmts
  # GET /engineering_mgmts.json
  layout 'adminpanel_tables'
  def index
    @engineering_mgmts = EngineeringMgmt.all
  end

  # GET /engineering_mgmts/1
  # GET /engineering_mgmts/1.json
  def show
  end

  # GET /engineering_mgmts/new
  def new
    @engineering_mgmt = EngineeringMgmt.new
  end

  # GET /engineering_mgmts/1/edit
  def edit
  end

  # POST /engineering_mgmts
  # POST /engineering_mgmts.json
  def create
    @engineering_mgmt = EngineeringMgmt.new(engineering_mgmt_params)

    respond_to do |format|
      if @engineering_mgmt.save
        format.html { redirect_to @engineering_mgmt, notice: 'Engineering mgmt was successfully created.' }
        format.json { render :show, status: :created, location: @engineering_mgmt }
      else
        format.html { render :new }
        format.json { render json: @engineering_mgmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engineering_mgmts/1
  # PATCH/PUT /engineering_mgmts/1.json
  def update
    respond_to do |format|
      if @engineering_mgmt.update(engineering_mgmt_params)
        format.html { redirect_to @engineering_mgmt, notice: 'Engineering mgmt was successfully updated.' }
        format.json { render :show, status: :ok, location: @engineering_mgmt }
      else
        format.html { render :edit }
        format.json { render json: @engineering_mgmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineering_mgmts/1
  # DELETE /engineering_mgmts/1.json
  def destroy
    @engineering_mgmt.destroy
    respond_to do |format|
      format.html { redirect_to engineering_mgmts_url, notice: 'Engineering mgmt was successfully destroyed.' }
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
  def set_engineering_mgmt
    @engineering_mgmt = EngineeringMgmt.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def engineering_mgmt_params
    params.require(:engineering_mgmt).permit(:title, :description)
  end
end
