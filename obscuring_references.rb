# the class definition below is poorly designed since the diamters method must know the input data structure
# class ObscuringReferences
#   attr_reader :data
#   def initialize(data)
#     @data = data
#   end

#   def diameters
#     # 0 is the rim. 1 is the tire
#     data.collect {|cell|
#       cell[0] + (cell[1] * 2)}
#   end
#   #... many other methods that index into the array
# end

# the diameters method below has no knowledge of the internal array structure
class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  # the method below clearly has two responsibilities - iterate over wheels and calculate diamter
  # def diameters
  #   wheels.collect {|wheel|
  #     wheel.rim + (wheel.tire * 2)}
  # end

# separate iteration from the action being performed

# first iterate over the array
  def diameters
    wheels.collect {|wheel| diameter(wheel)}
  end

  # second - calculate the diameter of one wheel
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  # instead of defining a class, Struct creates small, lightweight objects rim and tire
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell|
      Wheel.new(cell[0], cell[1])}
  end

end