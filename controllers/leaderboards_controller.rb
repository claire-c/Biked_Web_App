require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require('pry')
require_relative('../models/cyclist.rb')
require_relative('../models/ride.rb')
require_relative('../models/route.rb')
require_relative('../models/image_carousel.rb')

get '/leaderboards' do
  @rides = Ride.ordered()
  @routes = Route.all()
  @cyclists = Cyclist.all()
  erb(:"leaderboards/index")
end
