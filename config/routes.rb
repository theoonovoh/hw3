Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get("/", { :controller => "articles", :action => "index" })

  resources "places" do
  get("/places", { :controller => "places", :action => "index" })
  
  #new place form
  #get("/places/new", { :controller => "places", :action => "index" })

  #insert places into database
  post("/places", { :controller => "places", :action => "create" })

  #details page from companies:
  get("/places/:id", { :controller => "places", :action => "show" })


  resources "entries"
  get("/entries", { :controller => "entries", :action => "index" })
  get("/entries/new", { :controller => "entries", :action => "index" })
  post("/entries", { :controller => "entries", :action => "create" })
  get("/entries/:id", { :controller => "entries", :action => "show" })
end

end