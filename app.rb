# the "runner" where Sinatra lives (routes, handles user input, output is sent to views, etc.)
# traffic controller or entry point

require 'sinatra'
require_relative './numerology_reading'

# added CSS file
set :public_folder, 'public'

get '/' do 
  erb :form
end

post '/result' do
  birthdate = params[:birthdate]

  reading = NumerologyReading.new(birthdate)

  @message = reading.message

  erb :result
end