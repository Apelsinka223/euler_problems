# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

time = :os.system_time(:micro_seconds)
:math.pow(Enum.sum(1..100), 2)
|> Kernel.-(
    Enum.map(1..100, &(:math.pow(&1, 2)))
    |> Enum.sum
)
|> IO.puts
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'