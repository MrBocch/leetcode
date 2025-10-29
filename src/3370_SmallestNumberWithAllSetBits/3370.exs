defmodule Solution do
  @spec smallest_number(n :: integer) :: integer
  def smallest_number(n) do
    Stream.iterate(1, &(&1 + 1)) 
        |> Stream.map(fn x -> :math.pow(2, x) - 1 end)
        |> Stream.drop_while(fn x -> x < n end)
        |> Enum.at(0) 
        |> round()     
    end 
end
