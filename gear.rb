class Gear
  attr_reader :chainring, :cog, :wheel
  # always wrap instance variables in accessor methods instead of directly referring to variables
  # using attr_reader caused Ruby to create a simple wrapper for the variable
  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    # @rim = rim
    # @tire = tire
    @wheel = wheel
  end

  def ratio
    # @chainring / @cog.to_f <----- road to ruin
    chainring / cog.to_f
  end

  # the method below calculates both diameter and gear_inches
  # def gear_inches
  #   # tire goes around the rim twice for diameter
  #   ratio * (rim + (tire * 2))
  # end

  # here we refactor gear_inches
  def gear_inches
    ratio * wheel.diameter
  end

  # def diameter
  #   rim + (tire * 2)
  # end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

end

@wheel = Wheel.new(26, 1.5)

puts @wheel.circumference

puts Gear.new(52, 11, @wheel).gear_inches

puts Gear.new(52, 11).ratio







