class Gear
  attr_reader :chainring, :cog, :rim, :tire
  # always wrap instance variables in accessor methods instead of directly referring to variables
  # using attr_reader caused Ruby to create a simple wrapper for the variable
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
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

  # here we refactor gear_inches into two methods
  def gear_inches
    ratio * diameter
  end

  def diameter
    rim + (tire * 2)
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(30, 27, 24, 1.25).gear_inches