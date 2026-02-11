defmodule Solution do
  @spec get_sneaky_numbers(nums :: [integer]) :: [integer]
  def get_sneaky_numbers(nums) do
    nums 
      |> Enum.frequencies 
      |> Map.filter(fn { _k, v } -> v == 2 end) 
      |> Map.keys
  end
end