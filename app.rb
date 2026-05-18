# the "runner" where Sinatra lives (routes, handles user input, output is sent to views, etc.)
# traffic controller or entry point

require 'sinatra'
require_relative './numerology_reading'

set :bind, '0.0.0.0'
set :port, ENV.fetch("PORT", 4567)

# added CSS file
set :public_folder, 'public'

get '/' do 
  erb :form
end

post '/result' do
  birthdate = params[:birthdate]

  # validation handling
  unless birthdate.match?(/^\d{8}$/)
    @error = "Please enter a valid 8-digit birthdate (MMDDYYYY)."
    return erb :form
  end

  reading = NumerologyReading.new(birthdate)

  @message = reading.message

  erb :result
end