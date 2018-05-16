class Triangle
  attr_accessor :sides
  attr_reader :kind
  
  def initialize( side_1, side_2, side_3 )
    @sides = [ side_1, side_2, side_3 ]
  end
  
  def kind
    if @sides.all? { |side| side == 0 } ||
      @sides.any? { |side| side < 0 } ||
      # Check for triangle inequality:
      # The sum of the length of any 2 sides exceeds that of the third side
      ( @sides[0] + @sides[1] <= @sides[2] || 
        @sides[1] + @sides[2] <= @sides[0] || 
        @sides[0] + @sides[2] <= @sides[1] )
      raise TriangleError
    else
      unique_sides = @sides.uniq.length
      
      case unique_sides
        when 1
          @kind = :equilateral
        when 2 
          @kind = :isosceles
        when 3
          @kind = :scalene
      end
    end
  end
  
  class TriangleError < StandardError
    def message
      "invalid triangle"
    end
  end
  
end
