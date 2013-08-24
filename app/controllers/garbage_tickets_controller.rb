class GarbageTicketsController < ApplicationController
  require 'net/http'
  def index
    @garbage_tickets = GarbageTicket.all

    respond_to do |format|
      format.html
      format.json { render json: @garbage_tickets }
    end
  end

  def show
    @garbage_ticket = GarbageTicket.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @garbage_ticket }
    end
  end

  def new
    @garbage_ticket = GarbageTicket.new

    respond_to do |format|
      format.html
      format.json { render json: @garbage_ticket }
    end
  end

  def edit
    @garbage_ticket = GarbageTicket.find(params[:id])
  end

  def visualize
    @lat_long_group = GarbageTicket.count(:all, group: [:latitude, :longitude])
  end

  def create
    geocode_url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address=" + params[:garbage_ticket][:location]
    response_json = JSON.parse(Net::HTTP.get_response(URI.parse geocode_url).body)
    lat_lng = response_json["results"].first["geometry"]["location"]

    @garbage_ticket = GarbageTicket.new(params[:garbage_ticket].merge(latitude: lat_lng["lat"], longitude: lat_lng["lng"]))
    @garbage_ticket.save
    redirect_to :visualize
  end

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

  def destroy
    @garbage_ticket = GarbageTicket.find(params[:id])
    @garbage_ticket.destroy

    respond_to do |format|
      format.html { redirect_to garbage_tickets_url }
      format.json { head :no_content }
    end
  end
end
