@input = File.read('day5-input')

## Part 1

puts "---PART 1:---"

@bad_string_count = 0
@good_string_count = 0
@total_string_count = 0

@input.split("\n").each do |input|
  @total_string_count += 1

  ## Check for at least 3 vowels
  if input.scan(/[aeiou]/i).size < 3
    @bad_string_count += 1
    next
  end

  ## Check for double repeating letters
  #"Melanie is a noob".count('a')
  unless /([a-z])\1/i.match(input)
    @bad_string_count += 1
    next
  end

  ## Check for bad string parts
  if /ab|cd|pq|xy/i.match(input)
    @bad_string_count += 1
    next
  end

  ## All requirements have been met!
  @good_string_count += 1
  next
end

puts "The total number of string sets is... #{@total_string_count}"
puts "The total number of bad string sets is... #{@bad_string_count}"
puts "The total number of good string sets is... #{@good_string_count}"

## Part 2

puts "---PART 2:---"

@bad_string_count_2 = 0
@good_string_count_2 = 0
@total_string_count_2 = 0

@input.split("\n").each do |input|
  @total_string_count += 1

  unless input =~ /([a-z][a-z]).*\1/
    @bad_string_count_2 += 1
    next
  end

  unless input =~ (/([a-z]).\1/i)
    @bad_string_count_2 += 1
    next
  end

  ## All requirements have been met!
  @good_string_count_2 += 1
  next
end

puts "The total number of string sets is... #{@total_string_count}"
puts "The total number of bad string sets is... #{@bad_string_count_2}"
puts "The total number of good string sets is... #{@good_string_count_2}"
