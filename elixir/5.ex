#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

time = :os.system_time(:micro_seconds)
Enum.reduce(2..20, {[], 1}, fn
    a, {list, res} when rem(res, a) != 0 ->
        factor = Enum.reduce(list, a, fn
            factor, a when rem(a, factor) == 0 -> div(a, factor)
            _, a -> a
        end)
        {[factor | list], res * factor}
    _, {list, res} -> {list, res}
    end)
|>  elem(1)
|> IO.puts
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'