require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('../models/ride.rb')

#show all rides
get	"/rides" do
  @rides = Ride.all()
  erb(:"rides/index")
end

#post new ride and save to db ,redirect to all rides
post "/rides" do
  ride = Ride.new(params)
  ride.save()
  redirect to("/rides")
end

#get form to create new ride
get "/rides/new" do
  @cyclists = Cyclist.all()
  @routes = Route.all()
  erb(:"rides/new")
end

#get form to edit existing ride
get "/rides/:id/edit" do
  @ride = Ride.find(params[:id].to_i)
  @cyclists = Cyclist.all()
  @routes = Route.all()
  erb(:"rides/edit")
end

#delete individual ride
post "/rides/:id/delete" do
  ride = Ride.find(params[:id].to_i)
  ride.delete()
  redirect to("/rides")
end

#post updated ride and save to db, redirect to all rides
post "/rides/:id" do
  ride = Ride.new(params)
  ride.update()
  redirect to("/rides")
end

#show individual route
get "/rides/:id" do
  @ride = Ride.find(params[:id].to_i)
  erb(:"rides/show")
end
