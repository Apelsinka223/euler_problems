Stream.unfold({1, 1}, fn
        {a, b} when a < 4000000 -> {a, {b, a + b}}
        _ -> nil
    end
)
|> Stream.filter(&(rem(&1, 2) == 0))
|> Enum.sum
|> IO.inspect