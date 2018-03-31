require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('controllers/cyclists_controller')
require_relative('controllers/rides_controller')
require_relative('controllers/routes_controller')

get '/' do
  erb(:index)
end
