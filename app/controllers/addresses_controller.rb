class AddressesController < ApplicationController
  before_action :set_location
  
  def index
    @addresses = @location.addresses
  end

  def show
  end

  def new
    @trips = Trip.all - @location.trips
    @addresses = @location.addresses.new
  end
  
  def edit
  end

  def create
    @address = @location.addresses.new(address_params)
    if @address.save
      redirect_to location_addresses_path(@location)
    else
      render :new
    end

    def update
      @address = @address.find(params[:id])
      if @address.update(address_params)
        redirect_to trip_locations_path
      else
        render :edit
      end
    end

    def destroy
      @location.appointments.find(params[:id]).destroy
      redirect_to location_addresses_path(@location)
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
end
