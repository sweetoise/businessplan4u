class OutlinesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_voucher_admin_and_superadmin
  before_action :set_outline, only: [:show, :edit, :update, :destroy]
  # GET /outlines
  # GET /outlines.json
  layout 'adminpanel_tables'
  def index
    @outlines = Outline.all
  end

  # GET /outlines/1
  # GET /outlines/1.json
  def show
  end

  # GET /outlines/new
  def new
    @outline = Outline.new
    @entrepreneur_programs = EntrepreneurProgram.all
  end

  # GET /outlines/1/edit
  def edit
    @entrepreneur_programs = EntrepreneurProgram.all
  end

  # POST /outlines
  # POST /outlines.json
  def create
    @outline = Outline.new(outline_params)
    @entrepreneur_programs = EntrepreneurProgram.all
    respond_to do |format|
      if @outline.save(context: :not_import)
        format.html { redirect_to @outline, notice: 'Outline was successfully created.' }
        format.json { render :show, status: :created, location: @outline }
      else
        format.html { render :new }
        format.json { render json: @outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outlines/1
  # PATCH/PUT /outlines/1.json
  def update
    @entrepreneur_programs = EntrepreneurProgram.all
    respond_to do |format|
      if @outline.update(outline_params)
        format.html { redirect_to @outline, notice: 'Outline was successfully updated.' }
        format.json { render :show, status: :ok, location: @outline }
      else
        format.html { render :edit }
        format.json { render json: @outline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outlines/1
  # DELETE /outlines/1.json
  def destroy
    @outline.destroy
    respond_to do |format|
      format.html { redirect_to outlines_url, notice: 'Outline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Outline.import(params[:file])
    redirect_to outlines_url, notice: "Outlines imported."
    @outlines = Outline.all
  end

  private

  def check_voucher_admin_and_superadmin
    if current_user.has_role? :superadmin or current_user.has_role? :admin_user
      else
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_outline
    @outline = Outline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def outline_params
    params.require(:outline).permit(:question, :entrepreneur_program_id)
  end
end
