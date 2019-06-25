s1 = STDIN.gets.chomp.to_i
s2 = STDIN.gets.chomp.split(' ').map {|s| s.to_i}
s3 = STDIN.gets.chomp

puts (s1 + s2).to_s
puts s3

