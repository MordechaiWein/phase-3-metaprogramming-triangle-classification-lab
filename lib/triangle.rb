class Triangle

  attr_reader :side1, :side2, :side3
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validation
    if side1 == side2 && side1 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  def validation
    equality = side1 + side2 > side3 && side2 + side3 > side1 && side1 + side3 > side2
    larger = [side1, side2, side3].all? {|side| side > 0}
    if equality && larger
      true
    else
      # begin
        raise TriangleError
      # rescue TriangleError => error_instance
      #   puts error_instance.message
      # end
    end
  end

  class TriangleError < StandardError
    
    # def message
    #   "Error: this is not a triangle"
    # end
    
  end
    
end

