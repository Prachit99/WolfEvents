class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]

  # GET /admins or /admins.json
  def index
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to see admin details."
    end
    @admins = Admin.all
  end

  # GET /admins/1 or /admins/1.json
  def show
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to see admin details."
    end
  end

  # GET /admins/new
  def new
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to create new admin accounts."
    end
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to edit admin details."
    end
  end

  # POST /admins or /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_url(@admin), notice: "Admin was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1 or /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admin_url(@admin), notice: "Admin was successfully updated." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1 or /admins/1.json
  def destroy
    @admin.destroy!

    respond_to do |format|
      format.html { redirect_to admins_url, notice: "Admin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:email, :password, :name, :phone, :address, :credit_card)
    end
end
