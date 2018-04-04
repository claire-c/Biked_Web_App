require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('controllers/cyclists_controller')
require_relative('controllers/rides_controller')
require_relative('controllers/routes_controller')
require_relative('models/image_carousel.rb')

get '/leaderboards' do
  @rides = Ride.ordered()
  @routes = Route.all()
  @cyclists = Cyclist.all()
  erb(:"leaderboards/index")
end
