class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  #@available_rooms = Room.available_rooms('2024-02-14', '12:00', '14:00')

  # GET /events or /events.json
  def index
    @events = Event.filter(params[:filter_type], params[:filter_value])
    @upcoming_events = Event.upcoming.not_sold_out
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @available_rooms = Room.where(reserved:false)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      room = Room.find(params[:event][:room_id])
      @event.room = room
        if @event.save
          room.update(reserved: true)
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
    if params[:category].present?
      @events = @events.where(event_cat: params[:category])
    end

    if params[:date].present?
      @events = @events.where(event_date: params[:date])
    end

    if params[:price_range].present?
      min_price, max_price = params[:price_range].split('-').map(&:to_f)
      @events = @events.where(ticket_price: min_price..max_price)
    end

    if params[:search].present?
      @events = @events.where('event_name ILIKE ?', "%#{params[:search]}%")
    end
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

    # def rooms_available?(event,room)
    #   start_time = event.event_start_time
    #   end_time = event.event_start_time
    #   reserved_room_ids = Event.where(event_date: event.event_date)
    #                            .where.not(
    #     '(? >= event_start_time AND ? <= event_end_time) OR (? >= event_start_time AND ? <= event_end_time)',
    #     start_time, start_time,
    #     end_time, end_time
    #   )
    #                            .pluck(:room_id)
    #   !reserved_room_ids.include?(room.id) && !room.reserved
    # end
end
