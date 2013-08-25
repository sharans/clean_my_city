class GarbageTicketsController < ApplicationController
  require 'net/http'
  require 'cgi'

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

  def visualize
    @latitude = params[:location]["lat"]
    @longitude = params[:location]["lng"]
    @lat_long_group = GarbageTicket.count(:all, group: [:latitude, :longitude, :level])
  end

  def create
    geocode_url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address=" + CGI.escape(params[:garbage_ticket][:location])
    response_json = JSON.parse(Net::HTTP.get_response(URI.parse geocode_url).body)
    lat_lng = response_json["results"].first["geometry"]["location"]

    @garbage_ticket = GarbageTicket.new(params[:garbage_ticket].merge(latitude: lat_lng["lat"], longitude: lat_lng["lng"]))
    @garbage_ticket.save
    redirect_to visualize_path(location: lat_lng)
  end

  def destroy
    location = {lat: params[:lat], lng: params[:lng]}
    @garbage_ticket = GarbageTicket.where(latitude: location[:lat], longitude: location[:lng])
    @garbage_ticket.destroy_all
    redirect_to visualize_path(location: location)
  end
end
