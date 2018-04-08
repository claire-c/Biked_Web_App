require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry' )
require_relative('../models/route.rb')
require_relative('../models/convert_time.rb')

#show all routes
get	"/routes" do
  @routes = Route.all()
  erb(:"routes/index")
end

#post new route and save to db ,redirect to all routes
post "/routes" do
  route = Route.new(params)
  route.save()
  redirect to("/routes")
end

#get form to create new route
get "/routes/new" do
  erb(:"routes/new")
end

#get form to edit existing route
get "/routes/:id/edit" do
  @route = Route.find(params[:id].to_i)
  erb(:"routes/edit")
end

#delete individual route
post "/routes/:id/delete" do
  route = Route.find(params[:id].to_i)
  route.delete()
  redirect to("/routes")
end

#post updated route and save to db, redirect to all routes
post "/routes/:id" do
  route = Route.new(params)
  route.update()
  redirect to("/routes")
end

#show individual route
get "/routes/:id" do
  @route = Route.find(params[:id].to_i)
  @cyclists = @route.cyclists()
  erb(:"routes/show")
end
