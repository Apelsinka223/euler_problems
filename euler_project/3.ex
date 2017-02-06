# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143

number = 600851475143

defmodule LargestPrimeFactor do
    def factor(n, i, res), do: factor(n, i, res, n)

    def factor(n, i, res, number) when n == 1 or i >= div(number, 2), do:
        IO.puts res

    def factor(n, i, _, number) when rem(n, i) == 0, do:
        factor(div(n, i), i, i, number)

    def factor(n, i, res, number), do:
        factor(n,  i + 1, res, number)
end

time = :os.system_time(:micro_seconds)
LargestPrimeFactor.factor(number, 2, 0)
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'