class BusinessManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_business_management, only: [:show, :edit, :update, :destroy]
  # GET /business_managements
  # GET /business_managements.json
  layout 'adminpanel_tables'
  def index
    @business_managements = BusinessManagement.all
  end

  # GET /business_managements/1
  # GET /business_managements/1.json
  def show
  end

  # GET /business_managements/new
  def new
    @business_management = BusinessManagement.new
  end

  # GET /business_managements/1/edit
  def edit
  end

  # POST /business_managements
  # POST /business_managements.json
  def create
    @business_management = BusinessManagement.new(business_management_params)

    respond_to do |format|
      if @business_management.save
        format.html { redirect_to @business_management, notice: 'Business management was successfully created.' }
        format.json { render :show, status: :created, location: @business_management }
      else
        format.html { render :new }
        format.json { render json: @business_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_managements/1
  # PATCH/PUT /business_managements/1.json
  def update
    respond_to do |format|
      if @business_management.update(business_management_params)
        format.html { redirect_to @business_management, notice: 'Business management was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_management }
      else
        format.html { render :edit }
        format.json { render json: @business_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_managements/1
  # DELETE /business_managements/1.json
  def destroy
    @business_management.destroy
    respond_to do |format|
      format.html { redirect_to business_managements_url, notice: 'Business management was successfully destroyed.' }
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
  def set_business_management
    @business_management = BusinessManagement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def business_management_params
    params.require(:business_management).permit(:title, :description)
  end
end
