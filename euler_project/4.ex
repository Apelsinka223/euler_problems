# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

defmodule PalindromeMultiple do
  def find(), do: find(999, 999, 0)
  def find(a, b, result) when a > b, do: find(a - 1, 999, result)
  def find(99, 99, result), do: IO.puts result
  def find(a, b, result) do
    if result < a * b and Integer.to_string(a * b) == String.reverse(Integer.to_string(a * b)) do
        find(a - 1, 999, a * b)
    else
        find(a, b - 1, result)
    end
  end
end

time = :os.system_time(:micro_seconds)
PalindromeMultiple.find()
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'
