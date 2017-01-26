
sum = Enum.reduce(0..999, fn (a, sum) ->
        if (rem(a, 3) == 0 || rem(a, 5) == 0) do
            a + sum
        else
            sum
        end
    end
)
IO.puts sum

