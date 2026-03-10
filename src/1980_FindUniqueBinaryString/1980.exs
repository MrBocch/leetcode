defmodule Solution do
  @spec find_different_binary_string(nums :: [String.t]) :: String.t
  def find_different_binary_string(nums) do
    inums = Enum.map(nums, &String.to_integer(&1, 2))
    length = Enum.count(nums)
    [diff | xs] = Range.to_list(0..length**2) -- inums

    diff
      |> Integer.to_string(2) 
      |> String.pad_leading(length, "0")
  end 
end
