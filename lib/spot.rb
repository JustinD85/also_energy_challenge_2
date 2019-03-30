class Spot
  attr_reader :type, :vehicle

  def initialize(type)
    @type = type
    @vehicle = nil
  end

  def available?
    @vehicle.nil?
  end

  def park_vehicle(vehicle)
    @vehicle = vehicle
  end

  def remove_vehicle
    @vehicle = nil
  end

end
