
defmodule Prime do
  def at(n), do: at(n, 2, 2, 2, [])
  def at(n, n, _, last, _), do:  IO.puts last
  def at(n, i, next, last, list) do
    if (not Enum.any?(list, &(rem(next, &1) == 0))) do
      at(n, i + 1, next + 1, next, list ++ [next])
    else
      at(n, i, next + 1, last, list)
    end
  end
end

time = :os.system_time(:micro_seconds)
Prime.at(10001)
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'

time = :os.system_time(:micro_seconds)
IO.puts :timer.tc(fn ->
    Stream.unfold({[], 2},
    fn {list, a} ->
      if (not Enum.any?(list, &(rem(a, &1) == 0))) do
        {a, {list ++ [a], a + 1}}
      else
        {nil,{list, a + 1}}
      end
    _ -> nil
end)
|> Stream.reject(&(!&1))
|> Enum.at(10000)
|> IO.inspect
end)
|> elem(0)
|> IO.puts
IO.puts 'time: #{ (:os.system_time(:micro_seconds) - time) / 1000000} seconds'

