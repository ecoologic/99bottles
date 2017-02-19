class Bottles
  def song
    verses
  end

  def verses(starting = 99, ending = 0)
    starting.downto(ending).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    Verse.new(number).to_s
  end
end

###############################################################################

class Verse
  def initialize(number, max = 99)
    @number, @max = number, max
  end

  # Being a verse, the rhyme belongs here
  # No problem with this word duplication
  # Quantity and remain here, clearer to read
  def to_s
    "#{quantity.capitalize} on the wall, " +
    "#{quantity}.\n" +
    "#{action}, " +
    "#{quantity(remain)} on the wall.\n"
  end

  private

  attr_reader :number, :max

  # Handles all words of the same context ("beer" and "bottle")
  # If I had to change the song to "lollies", I would only touch this method
  # There is some dup, but it's not worth extracting it
  def quantity(n = number)
    result =
      case n
      when 0 then "no more bottles"
      when 1 then "1 bottle"
      # when 6 then "1 pack"
      else        "#{n} bottles"
      end
    "#{result} of beer"
  end

  def action
    if number.zero?
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    number == 1 ? "it" : "one"
  end

  def remain
    number.zero? ? max : (number - 1)
  end
end
