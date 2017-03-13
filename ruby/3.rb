# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143

n = 600851475143
factor = n
start = Time.now

(2...n.div(2)).each do |item|
  if factor % item == 0
    factor = factor / item
  end
  if factor == 1
    puts item
    break
  end
end

puts Time.now - start