# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

time = :os.system_time(:micro_seconds)
Enum.reduce(0..999, fn
    a, sum when (rem(a, 3) == 0 or rem(a, 5) == 0) -> a + sum
    _, sum -> sum
    end
)
|> IO.puts
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'

time = :os.system_time(:micro_seconds)
Stream.filter(0..999, &(rem(&1, 3) == 0 or rem(&1, 5) == 0))
|> Enum.sum
|> IO.puts
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'

time = :os.system_time(:micro_seconds)
Enum.take_every(0..999, 3)
|> Enum.concat(Enum.take_every(0..999, 5))
|> Enum.uniq
|> Enum.sum
|>IO.puts
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'