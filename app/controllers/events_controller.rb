class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.filter(params[:filter_type], params[:filter_value]).order(:event_date)
    @upcoming_events = Event.upcoming.not_sold_out

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @rooms = Room.all
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to view rooms."
    end
  end

  # GET /events/1/edit
  def edit
    admin = current_admin
    unless admin
      redirect_to root_path, notice: "You are not authorized to view rooms."
    end
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
        if @event.save
          format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upcoming_events
    @upcoming_events = Event.upcoming.not_sold_out
  end

  def past_events
    @past_events = Event.past
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_name, :event_cat, :event_date, :event_start_time, :event_end_time, :ticket_price, :no_of_seats, :room_id)
    end

end
