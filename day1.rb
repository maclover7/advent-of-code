@input = File.read('day1-input')

## Part 1

puts "---PART 1:---"

@floor1 = 0
@up_count1 = 0
@down_count1 = 0

@input.split("").each do |i|
  if i == "("
    @up_count1 += 1
    @floor1 += 1
  elsif i == ")"
    @down_count1 += 1
    @floor1 -= 1
  end
end

puts "Down count equals... #{@down_count1}"
puts "Up count equals... #{@up_count1}"
puts "Floor equals... #{@floor1}"

## Part 2

puts "---PART 2:---"
@floor2 = 0

@input.split("").each_with_index do |value, index|
  if value == "("
    @floor2 += 1
  elsif value == ")"
    @floor2 -= 1
  end

  if @floor2 == -1
    puts "At character #{index + 1}, @floor equals #{@floor2}"
  end
end
