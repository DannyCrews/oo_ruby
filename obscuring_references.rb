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
