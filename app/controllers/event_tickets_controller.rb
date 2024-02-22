class EventTicketsController < ApplicationController
  # before_action :set_event_ticket, only: %i[ show edit update destroy ]

  # GET /event_tickets or /event_tickets.json
  def index
    @event_tickets = EventTicket.all
    @event_tickets = EventTicket.filter(params[:event_id], params[:attendee_id])

  end

  # GET /event_tickets/1 or /event_tickets/1.json
  def show
    @event_ticket = EventTicket.find(params[:id])
  end

  # GET /event_tickets/new
  def new
    # @event = Event.find(params[:event_id])
    @event_ticket = EventTicket.new
    if @event.nil?
      @event = Event.find(params[:event_id])
    end
  end

  # GET /event_tickets/1/edit
  def edit
  end

  # POST /event_tickets or /event_tickets.json
  def create
    @event_ticket = EventTicket.new(event_ticket_params)

    @event = Event.find(params[:event_ticket][:event_id])
    @event_ticket.confirmation_num = rand(0..999999)
    respond_to do |format|
      if @event_ticket.save
        format.html { redirect_to event_ticket_url(@event_ticket), notice: "Event ticket was successfully created." }
        format.json { render :show, status: :created, location: @event_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /event_tickets/1 or /event_tickets/1.json
  def update
    respond_to do |format|
      if @event_ticket.update(event_ticket_params)
        format.html { redirect_to event_ticket_url(@event_ticket), notice: "Event ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @event_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_tickets/1 or /event_tickets/1.json
  def destroy
    @event_ticket.destroy!

    respond_to do |format|
      format.html { redirect_to event_tickets_url, notice: "Event ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def signup_for_event
  #   @attendee = current_user
  #   @event = Event.find(params[:event_id])
  #
  #   # You can check if the user already has a ticket for this event
  #   if @attendee.has_ticket_for_event?(@event)
  #     flash[:notice] = "You already have a ticket for this event."
  #     redirect_to @event
  #     return
  #   end
  #
  #   # Generate a confirmation number
  #   confirmation_number = generate_confirmation_number(@event.id, @event.room.id, @attendee.id)
  #
  #   # Create an EventTicket
  #   @event_ticket = EventTicket.new(
  #     attendee: @attendee,
  #     event: @event,
  #     room: @event.room,
  #     confirmation_num: confirmation_number
  #   )
  #
  #   if @event_ticket.save
  #     flash[:success] = "Successfully signed up for the event!"
  #     redirect_to event_ticket_path(@event_ticket)
  #   else
  #     flash[:error] = "Failed to sign up for the event. Please try again."
  #     redirect_to @event
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event_ticket
    #   @event_ticket = EventTicket.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def event_ticket_params
      params.require(:event_ticket).permit(:event_id, :attendee_id, :room_id, :confirmation_num)
    end

  def generate_confirmation_number(event_id,room_id,attendee_id)
    confirmation_number = "#{event_id}-#{room_id}-#{attendee_id}"
  end
end
