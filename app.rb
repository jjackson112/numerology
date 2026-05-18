# the "runner" where Sinatra lives (routes, handles user input, output is sent to views, etc.)
# traffic controller or entry point

require 'sinatra'
require_relative './main.rb'

get '/' do 
  "Sinatra is working"
end