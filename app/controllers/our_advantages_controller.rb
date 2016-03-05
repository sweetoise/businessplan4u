class OurAdvantagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_our_advantage, only: [:show, :edit, :update, :destroy]
  # GET /our_advantages
  # GET /our_advantages.json
  layout 'adminpanel_tables'
  def index
    @our_advantages = OurAdvantage.all
  end

  # GET /our_advantages/1
  # GET /our_advantages/1.json
  def show
  end

  # GET /our_advantages/new
  def new
    @our_advantage = OurAdvantage.new
  end

  # GET /our_advantages/1/edit
  def edit
  end

  # POST /our_advantages
  # POST /our_advantages.json
  def create
    @our_advantage = OurAdvantage.new(our_advantage_params)

    respond_to do |format|
      if @our_advantage.save
        format.html { redirect_to @our_advantage, notice: 'Our advantage was successfully created.' }
        format.json { render :show, status: :created, location: @our_advantage }
      else
        format.html { render :new }
        format.json { render json: @our_advantage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /our_advantages/1
  # PATCH/PUT /our_advantages/1.json
  def update
    respond_to do |format|
      if @our_advantage.update(our_advantage_params)
        format.html { redirect_to @our_advantage, notice: 'Our advantage was successfully updated.' }
        format.json { render :show, status: :ok, location: @our_advantage }
      else
        format.html { render :edit }
        format.json { render json: @our_advantage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /our_advantages/1
  # DELETE /our_advantages/1.json
  def destroy
    @our_advantage.destroy
    respond_to do |format|
      format.html { redirect_to our_advantages_url, notice: 'Our advantage was successfully destroyed.' }
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
  def set_our_advantage
    @our_advantage = OurAdvantage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def our_advantage_params
    params.require(:our_advantage).permit(:title, :description)
  end
end
