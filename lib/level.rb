require './lib/row'

class Level
  attr_reader :rows

  def initialize
    @rows = []
  end

  def add_a_row(row)
    rows << row
  end

  def attempt_add_a_vehicle?(vehicle)
    @rows.find { |row| row.attempt_park_vehicle?(vehicle) }
  end

end
