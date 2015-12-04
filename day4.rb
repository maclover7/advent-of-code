require 'openssl'
@input = 'yzbqklnj'

## Part 1

puts "---PART 1:---"

(1..10000000).each do |i|
  md5 = OpenSSL::Digest::MD5.hexdigest(@input + i.to_s)
  if md5 =~ /^00000/
    puts "The random number would have to equal #{i}"
    puts "The full hash is: #{md5}"
    break
  end
end

## Part 2

puts "---PART 2:---"

(1..10000000).each do |i|
  md5 = OpenSSL::Digest::MD5.hexdigest(@input + i.to_s)
  if md5 =~ /^000000/
    puts "The random number would have to equal #{i}"
    puts "The full hash is: #{md5}"
    break
  end
end
