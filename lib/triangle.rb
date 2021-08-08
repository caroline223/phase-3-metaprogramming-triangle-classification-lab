class Triangle
  # write code here

  attr_reader :side_1, :side_2, :side_3
  
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    self.valid_triangle?
      if @side_1 == @side_2 && @side_2 == @side_3
        :equilateral
      elsif @side_1 == @side_2 || @side_1 == @side_3 || @side_2 == @side_3
        :isosceles
      else
        :scalene
      end
  end

  def valid_triangle?
    #Triangle inequality theorem states that the sum of two sides in a triangle must be larger than the third side

    real_triangle = [(@side_1 + @side_2 > @side_3),(@side_1 + @side_3 > @side_2),(@side_2 + @side_3 > @side_1)]
    [@side_1, @side_2, @side_3].each do |side|
      real_triangle << false if side <= 0
      raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
    puts "This is an error for a bad triangle"
  end


end
