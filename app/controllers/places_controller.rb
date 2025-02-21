class PlacesController < ApplicationController

  def index
    # find all Place rows
    @places = Place.all
    # render places/index view
  end
  
  def show
      @place = Place.find(params[:id])
      @entries = @place.entries || [] # This will set @entries to an empty array if it's nil
    end
  

  def new
    # render places/new view with a new Place form
    @place = Place.new
  end

  def create
    # start with a new Place
    @place = Place.new
    # assign user-entered form data to Place's columns
    @place["name"] = params["place"]["name"]
    # save Place row
    if @place.save
      # redirect user to the places list
      redirect_to places_path
    else
      # render new form again if validation fails
      render :new
    end
  end
end
