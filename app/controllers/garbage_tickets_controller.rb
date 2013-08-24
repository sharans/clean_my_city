class GarbageTicketsController < ApplicationController
  # GET /garbage_tickets
  # GET /garbage_tickets.json
  def index
    @garbage_tickets = GarbageTicket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @garbage_tickets }
    end
  end

  # GET /garbage_tickets/1
  # GET /garbage_tickets/1.json
  def show
    @garbage_ticket = GarbageTicket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @garbage_ticket }
    end
  end

  # GET /garbage_tickets/new
  # GET /garbage_tickets/new.json
  def new
    @garbage_ticket = GarbageTicket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @garbage_ticket }
    end
  end

  # GET /garbage_tickets/1/edit
  def edit
    @garbage_ticket = GarbageTicket.find(params[:id])
  end

  # POST /garbage_tickets
  # POST /garbage_tickets.json
  def create
    @garbage_ticket = GarbageTicket.new(params[:garbage_ticket])

    respond_to do |format|
      if @garbage_ticket.save
        format.html { redirect_to @garbage_ticket, notice: 'Garbage ticket was successfully created.' }
        format.json { render json: @garbage_ticket, status: :created, location: @garbage_ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @garbage_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /garbage_tickets/1
  # PUT /garbage_tickets/1.json
  def update
    @garbage_ticket = GarbageTicket.find(params[:id])

    respond_to do |format|
      if @garbage_ticket.update_attributes(params[:garbage_ticket])
        format.html { redirect_to @garbage_ticket, notice: 'Garbage ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @garbage_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garbage_tickets/1
  # DELETE /garbage_tickets/1.json
  def destroy
    @garbage_ticket = GarbageTicket.find(params[:id])
    @garbage_ticket.destroy

    respond_to do |format|
      format.html { redirect_to garbage_tickets_url }
      format.json { head :no_content }
    end
  end
end
