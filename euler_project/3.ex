n = 600851475143

Enum.reduce(2..(div(n, 2) + 1), %{primes: [], dividers: []}, fn a, list ->
  prime = (not Enum.any?(list[:primes], &(rem(a, &1) == 0)))
  divider = (rem(n, a) == 0)

  cond do
    prime and divider ->
        %{primes: [a] ++ list[:primes], dividers:  [a] ++ list[:dividers]}
    prime ->
        %{primes: [a] ++ list[:primes], dividers:  list[:dividers]}
    true ->
        list
  end
end)[:dividers]
|> Enum.at(0)
|> IO.puts
