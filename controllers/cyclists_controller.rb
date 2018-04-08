require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
# require( 'pry' )
require_relative('../models/cyclist.rb')


#show all cyclists
get	"/cyclists" do
  @cyclists = Cyclist.all()
  erb(:"cyclists/index")
end

#post new cyclist and save to db, redirect to all cyclists
post "/cyclists" do
  cyclist = Cyclist.new(params)
  cyclist.save()
  redirect to("/cyclists")
end

#get form to create new cyclist
get "/cyclists/new" do
  erb(:"cyclists/new")
end

#get form to edit existing cyclist
get "/cyclists/:id/edit" do
  @cyclist = Cyclist.find(params[:id].to_i)
  erb(:"cyclists/edit")
end

#delete individual cyclist
post "/cyclists/:id/delete" do
  cyclist = Cyclist.find(params[:id].to_i)
  cyclist.delete()
  redirect to("/cyclists")
end

#post updated cyclist and save to db, redirect to all cyclists
post "/cyclists/:id" do
  cyclist = Cyclist.new(params)
  cyclist.update()
  redirect to("/cyclists")
end

#show individual cyclist
get "/cyclists/:id" do
  @cyclist = Cyclist.find(params[:id].to_i)
  @routes = @cyclist.route_names
  erb(:"cyclists/show")
end
