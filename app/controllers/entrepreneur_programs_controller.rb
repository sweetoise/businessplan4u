class EntrepreneurProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_entrepreneur_program, only: [:show, :edit, :update, :destroy]
  # GET /entrepreneur_programs
  # GET /entrepreneur_programs.json
  layout 'adminpanel_tables'
  def index
    @entrepreneur_programs = EntrepreneurProgram.all
  end

  # GET /entrepreneur_programs/1
  # GET /entrepreneur_programs/1.json
  def show
  end

  # GET /entrepreneur_programs/new
  def new
    @entrepreneur_program = EntrepreneurProgram.new
  end

  # GET /entrepreneur_programs/1/edit
  def edit
  end

  # POST /entrepreneur_programs
  # POST /entrepreneur_programs.json
  def create
    @entrepreneur_program = EntrepreneurProgram.new(entrepreneur_program_params)

    respond_to do |format|
      if @entrepreneur_program.save
        format.html { redirect_to @entrepreneur_program, notice: 'Entrepreneur program was successfully created.' }
        format.json { render :show, status: :created, location: @entrepreneur_program }
      else
        format.html { render :new }
        format.json { render json: @entrepreneur_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrepreneur_programs/1
  # PATCH/PUT /entrepreneur_programs/1.json
  def update
    respond_to do |format|
      if @entrepreneur_program.update(entrepreneur_program_params)
        format.html { redirect_to @entrepreneur_program, notice: 'Entrepreneur program was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrepreneur_program }
      else
        format.html { render :edit }
        format.json { render json: @entrepreneur_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrepreneur_programs/1
  # DELETE /entrepreneur_programs/1.json
  def destroy
    @entrepreneur_program.destroy
    respond_to do |format|
      format.html { redirect_to entrepreneur_programs_url, notice: 'Entrepreneur program was successfully destroyed.' }
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
  def set_entrepreneur_program
    @entrepreneur_program = EntrepreneurProgram.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entrepreneur_program_params
    params.require(:entrepreneur_program).permit(:topic, :description)
  end
end
