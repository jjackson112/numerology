# input → transform → calculate → output

# create object - Classes don't run the program
# @birthdate, @number + @message become instance variables

class NumerologyReading
  attr_reader :birthdate, :number # is read, doesn't change

  def initialize(birthdate)
    @birthdate = birthdate
    @number = calculate_number
  end

  def calculate_number
    number = birthdate.chars.map(&:to_i).sum

    while number > 9
      number = number.digits.sum # already an array with the sum of all integers - no need to convert back to string
    end

    number
  end

  def message 
  # single digit path
    case number
    when 1
      "Your numerology number is #{number}. \nOne is the leader. The number one indicates the abiliry to stand alone, and is a strong vibration. Ruled by the Sun."
    when 2
      "Your numerology number is #{number}. \nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
    when 3
      "Your numerology number is #{number}. \nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
    when 4
      "Your numerology number is #{number}. \nThis is the worker. Practical, with a love of detail, Fours are trustworth, hardworking, and helpful. Ruled by Uranus."
    when 5
      "Your numerology number is #{number}. \nThis is the freedom lover. The number five is an intellectual vibration. These are idea people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
    when 6
      "Your numerology number is #{number}. \nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
    when 7
      "Your numerology number is #{number}. \nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
    when 8
      "Your numerology number is #{number}. \nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
    when 9
      "Your numerology number is #{number}. \nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
    else
      "Uh oh! Your birth path number is not 1-9! But you have an interesting soul!"
    end
  end
end

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


# use array syntax to access each element (number) in the birthdate, convert each one to an integer, and add them all together
# number = birthdate[0].to_i + birthdate[1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i
# chars turns '07141991' into an array + .map(&:to_i) converts each character to an integer + .sum adds them