# terminal version
def run
  puts "What's your birthdate? (MMDDYYYY)"
  birthdate = gets.chomp
  unless birthdate.match?(/^\d{8}$/)
    puts "Invalid birthdate."
    exit
  end
  
  reading = NumerologyReading.new(birthdate)

  puts reading.message
end
 run