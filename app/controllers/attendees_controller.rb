class AttendeesController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_attendee, only: %i[ show edit update destroy ]

  # GET /attendees or /attendees.json
  def index
    @attendees = Attendee.all
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to view rooms."
    end
  end

  # GET /attendees/1 or /attendees/1.json
  def show
    @attendee = Attendee.find(params[:id])
    @current_user = current_user
    # Ensure that the current attendee can only access their own profile
    if @attendee != @current_user and !current_admin
      redirect_to root_path, notice: "You are not authorized to view other profiles."
    end
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
    @current_user = current_user
    if (!@current_user or @current_user.id != @attendee.id) and !current_admin
      redirect_to root_path, notice: "You are not authorized to edit others' profiles."
    end
  end

  # POST /attendees or /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to attendee_url(@attendee), notice: "Attendee was successfully created." }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1 or /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to attendee_url(@attendee), notice: "Attendee was successfully updated." }
        format.json { render :show, status: :ok, location: @attendee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1 or /attendees/1.json
  def destroy
    @attendee.destroy!

    respond_to do |format|
      if current_user
        reset_session
        format.html{redirect_to root_path, notice: "Account successfully destroyed." }
      else
        format.html { redirect_to attendees_url, notice: "Attendee was successfully destroyed." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendee_params
      params.require(:attendee).permit(:name, :email, :password, :phone, :address, :credit_card)
    end
end
