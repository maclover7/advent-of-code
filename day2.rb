@input = File.read('day2-input')

## Part 1

puts "---PART 1:---"

class Box
  def initialize(input)
    @partitioned_input = input.split('x') { |i| i.to_i }
    @height = @partitioned_input[0].to_i
    @length = @partitioned_input[1].to_i
    @width = @partitioned_input[2].to_i
    ##
    @area = 0
    @ribbon = 0
  end

  def area
    @area += (2 * @length * @width)
    @area += (2 * @width * @height)
    @area += (2 * @height * @length)

    # special slack addon
    slack_input = [@height, @length, @width]
    min = slack_input.sort[0]
    min2 = slack_input.sort[1]
    @area += (min * min2)
    @area
  end

  def ribbon
    ribbon_input = [@height, @length, @width]
    min = ribbon_input.sort[0]
    @ribbon += (min * 2)
    min2 = ribbon_input.sort[1]
    @ribbon += (min2 * 2)
    @ribbon += @height * @length * @width
    @ribbon
  end
end

@total_square_feet = 0

@input.split("\n").each do |i|
  @box = Box.new(i)
  @total_square_feet += @box.area
end

puts "Total square feet required equals... #{@total_square_feet}"

## Part 2

puts "---PART 2:---"

@ribbon_square_feet = 0

@input.split("\n").each do |i|
  @box = Box.new(i)
  @ribbon_square_feet += @box.ribbon
end

puts "Total square feet of ribbon required equals... #{@ribbon_square_feet}"
