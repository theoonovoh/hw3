class EntriesController < ApplicationController
  def index

    @place = Place.find_by(id: params[:place_id])  # This will safely return nil if not found
    
    if @place.nil?
      # Handle the case where the place is not found (optional)
      flash[:error] = "Place not found"
      redirect_to places_path  # Redirect to places index page (or other appropriate page)
    else
      @entries = @place.entries  # Fetch the entries associated with this place
    end
  end

  def new
    # find the associated Place
    @place = Place.find(params[:place_id])
    # render entries/new view with a new Entry form
    @entry = Entry.new
  end

  def create
    # find the associated Place
    @place = Place.find(params[:place_id])
    # start with a new Entry for the specific place
    @entry = @place.entries.new
    # assign user-entered form data to Entry's columns
    @entry["title"] = params["entry"]["title"]
    @entry["description"] = params["entry"]["description"]
    @entry["date"] = params["entry"]["date"]
    # save Entry row
    if @entry.save
      # redirect user back to the place's page
      redirect_to place_path(@place)
    else
      # render new form again if validation fails
      render :new
    end
  end

end
