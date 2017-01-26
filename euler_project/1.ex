Enum.reduce(0..999, fn
    a, sum when (rem(a, 3) == 0 or rem(a, 5) == 0) -> a + sum
    _, sum -> sum
    end
)
|> IO.puts

Stream.filter(0..999, &(rem(&1, 3) == 0 or rem(&1, 5) == 0))
|> Enum.sum
|> IO.puts

