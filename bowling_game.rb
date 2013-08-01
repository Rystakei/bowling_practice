class BowlingGame
  def initialize
    @rolls = []
  end


# Record a roll in the game.
#
# pins - The Integer number of pins knocked down in this roll.
#
# Returns nothing.
  def roll(pins)
    @rolls.push(pins)
  end

# Returns the Integer score for this game.
  def score
    total_score  = 0
    current_roll = 0

    while current_roll < @rolls.size - 1 # This is how you can tell when you get to the end of the rolls
      roll      = @rolls[current_roll]
      next_roll = @rolls[current_roll + 1]
      next_next_roll = @rolls[current_roll + 2]

      if roll == 10
        total_score = score_strike(next_roll, next_next_roll)
        current_roll += 1
      elsif roll + next_roll == 10
        total_score += 10 + @rolls[current_roll + 2]
        current_roll += 2
      else
        total_score += roll + next_roll
        current_roll += 2
      end
    end

    return total_score
  end

  private

  def score_strike(roll1, roll2)
    10 + roll1 + roll2
  end
end
