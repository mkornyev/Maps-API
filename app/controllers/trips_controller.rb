class TripsController < ApplicationController
    swagger_controller :trips, "Trips"

    before_action :set_trip, only: [:show, :update, :destroy]
  
    # GET /trips
    swagger_api :index do
      summary "Gets all Trips"
    end
    def index
      @trips = Trip.all
  
      render json: @trips
    end
  
    # GET /trips/1
    swagger_api :show do
      summary "Shows one Trip"
      param :path, :id, :integer, :required, "Trip ID"
      notes "Lists all attributes for a trip."
      response :not_found
    end
    def show
      render json: @trip
    end
  
    # POST /trip
    swagger_api :create do
      summary "Creates a new Trip"
      param :form, :user, :integer, :required, "User ID"
      param :form, :from_location, :string, :required, "From location"
      param :form, :to_location, :string, :optional, "To location"
      param :form, :distance, :integer, :required, "Distance in miles"
      param :form, :start_date, :date, :required, "Start Date"
      param :form, :end_date, :date, :optional, "End Date"
      param :form, :visible, :boolean, :required, "Post Visibility"
      response :not_acceptable
    end
    def create
      @trip = Trip.new(trip_params)
  
      if @trip.save
        render json: @trip, status: :created, location: @trip
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /trip/1
    swagger_api :update do
      summary "Updates a Trip"
      param :path, :id, :integer, :required, "Trip Id"
      param :path, :user, :integer, :optional, "User Id"
      param :form, :from_location, :string, :optional, "From location"
      param :form, :to_location, :string, :optional, "To location"
      param :form, :distance, :integer, :optional, "Distance in miles"
      param :form, :start_date, :date, :optional, "Start Date"
      param :form, :end_date, :date, :optional, "End Date"
      param :form, :visible, :boolean, :optional, "Post Visibility"
      response :not_found
      response :not_acceptable
    end
    def update
      if @trip.update(trip_params)
        render json: @trip
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /trip/1
    swagger_api :destroy do
      summary "Deletes a Trip"
      param :path, :id, :integer, :required, "Trip Id"
      response :not_found
    end
    def destroy
      @trip.destroy
    end
  
    private
      def set_trip
        @trip = Trip.find(params[:id])
      end
  
      def trip_params 
      	# Permit all 
        params.permit(:user, :from_location, :to_location, :distance, :start_date, :end_date, :visible)
      end
  end

