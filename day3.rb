@input = File.read('day3-input')

## Part 1

puts "---PART 1:---"

@current_location = { horizontal: 0, vertical: 0 }
@houses = []

@input.split("").each do |i|
  if i == "<"
    @current_location[:horizontal] -= 1
    @houses << @current_location.dup
  elsif i == "v"
    #@houses << @current_location.dup
    @current_location[:vertical] -= 1
    @houses << @current_location.dup
  elsif i == ">"
    @houses << @current_location.dup
    @current_location[:horizontal] += 1
    @houses << @current_location.dup
  elsif i == "^"
    #@houses << @current_location.dup
    @current_location[:vertical] += 1
    @houses << @current_location.dup
  end
end

@houses_count = @houses.uniq.count

puts "Total number of unique houses that received presents is ... #{@houses_count}"

## Part 2

puts "---PART 2:---"

alt = 0
x1 = 0
x2 = 0
y1 = 0
y2 = 0

current = x1.to_s + "," + y1.to_s
locations = {}
locations[current] = "visited"

@input.split("").each do |c|
  if alt == 0
    alt = 1

    if c == '^'
      y1 += 1
    elsif c == 'v'
      y1 -= 1
    elsif c == '<'
      x1 -= 1
    elsif c == '>'
      x1 += 1
    end
    current = x1.to_s + "," + y1.to_s
    locations[current] = ""
  else
    alt = 0
    if c == '^'
      y2 += 1
    elsif c == 'v'
      y2 -= 1
    elsif c == '<'
      x2 -= 1
    elsif c == '>'
      x2 += 1
    end
    current = x2.to_s + "," + y2.to_s
    locations[current] = "visited"
  end
end

puts "Total number of unique houses that received presents is ... #{locations.length}"
