require './lib/level'

class ParkingGarage
  attr_reader :levels

  def initialize
    @levels = []
  end

  def add_a_level(level)
    @levels << level
  end

  def attempt_park_vehicle?(vehicle)
    has_parked = @levels.find { |level| level.attempt_add_a_vehicle?(vehicle) }
    has_parked ? true : "Sorry valued customer, there is no space available."
  end

end
