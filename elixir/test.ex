string = Task.async(fn -> IO.gets "" end)
|> Task.await(:infinity)
|> String.replace_trailing("\n", "")
number = Task.async(fn -> IO.gets "" end)
|> Task.await(:infinity)
|> String.replace_trailing("\n", "")
|> String.to_integer


(1..number)
|> Enum.map(fn i ->
        result = Task.async(fn -> IO.gets "" end)
        |> Task.await(:infinity)
        |> String.myers_difference(string)
        |> List.foldl(%{eq: 0, ins: 0, del: 0}, fn(x, acc) ->
                Map.update(acc, elem(x, 0), 0, & &1 + String.length(elem(x, 1)))
            end
        )

IO.inspect result
        IO.puts "#{result[:eq]} #{result[:del] - result[:ins]}"
    end
)