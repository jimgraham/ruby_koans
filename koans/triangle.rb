# Triangle Project Code.
require 'set'

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#


def triangle(a, b, c)
  sides = [a, b, c]

  confirm_valid_triangle(sides)

  classify_triangle(sides)

end

private

def confirm_valid_triangle(sides)
  if sides.any? { |s| s <= 0 }
    raise TriangleError
  end

  # https://en.wikipedia.org/wiki/Triangle_inequality
  permutations = sides.permutation.to_a
  permutations.each do |perm_sides|
    s = perm_sides.shift
    sum_other_sides = 0.0
    perm_sides.each { |p| sum_other_sides += p }

    if sum_other_sides <= s
      raise TriangleError
    end
  end
end

def classify_triangle(sides)
  sides = Set.new(sides)

  case sides.size
    when 1
      :equilateral
    when 2
      :isosceles
    else
      :scalene
  end
end


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
