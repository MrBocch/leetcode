defmodule Solution do
  @spec binary_gap(n :: integer) :: integer
  def binary_gap(n) do
    n 
      |> Integer.to_string(2) 
      |> String.graphemes() # pattern matching on bitstring is really ugly
      |> reducer(0, 0)
  end
  def reducer(["0"], max_gap, _), do: max_gap 
  def reducer(["1"], max_gap, curr), do: max(max_gap, curr)
  def reducer(["0" | rest], max_gap, curr), do: reducer(rest, max_gap, curr+1)
  def reducer(["1" | rest], max_gap, curr), do: reducer(rest, max(max_gap, curr), 1)
end