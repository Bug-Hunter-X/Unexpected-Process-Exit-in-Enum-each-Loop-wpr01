```elixir
list = [1, 2, 3, 4, 5]

Enum.each(list, fn x ->
  if x == 3 do
    throw(:stop) # Use throw to stop iteration gracefully
  end
  IO.puts(x)
end)

# or alternatively, use Enum.reduce to handle potential early termination
list = [1, 2, 3, 4, 5]

result = Enum.reduce(list, [], fn x, acc ->
  if x == 3 do
    {:halted, acc} #Return a tuple to signal termination
  else
    [x | acc]  #Otherwise accumulate
  end
end)

IO.inspect(result)
```