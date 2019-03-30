require './lib/spot'

class Row
  attr_reader :spots

  def initialize
    @spots = []
  end

  def add_a_spot(spot)
    @spots << spot
  end

  def attempt_park_vehicle?(vehicle)
    case vehicle.type
    when :motorcycle
      found_spot = @spots.find { |spot| spot.available? }
      found_spot.park_vehicle(vehicle) if found_spot
    when :car
      found_spot = @spots.find do |spot|
        spot.type == :compact ||
          spot.type == :large
      end
      found_spot.park_vehicle(vehicle) if found_spot
    when :bus
      found_spots = false
      @spots.each_cons(5) do |cons_spots|
        found_spots = cons_spots if cons_spots.all? do |spot|
          spot.available? && spot.type == :large
        end
      end
      found_spots.each { |spot| spot.park_vehicle(vehicle) } if found_spots
    end

  end

end
