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

  if sides.any? { |s| s <= 0 }
    raise TriangleError
  end

  # https://en.wikipedia.org/wiki/Triangle_inequality
  sides.each do |s|
    other_sides = sides.clone
    other_sides.delete_at(sides.index(s))

    # `.sum` not in Ruby 2.3
    sum_other_sides = 0.0
    other_sides.each { |s| sum_other_sides += s }

    if sum_other_sides <= s
      raise TriangleError
    end
  end

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
