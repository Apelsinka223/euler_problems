require 'active_support/core_ext/enumerable'
start = Time.now
sum = 0
(0..999).each do |item|
  if item % 3 == 0 || item % 5 == 0
    sum += item
  end
end

puts sum
puts Time.now - start

start = Time.now
list = (0..999).reject{ |item| (item % 3 != 0 && item % 5 != 0) }
sum = list.sum

puts sum
puts Time.now - start

start = Time.now
sum = (0..999).reduce{ |sum, item| (item % 3 == 0 || item % 5 == 0) ? sum + item : sum }

puts sum
puts Time.now - start

start = Time.now
sum = 0
(0..999).step(3) { |item| sum += item }
(0..999).step(5) { |item| sum += item }
(0..999).step(15) { |item| sum -= item }

puts sum
puts Time.now - start