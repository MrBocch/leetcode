defmodule Solution do
  @spec find_middle_index(nums :: [integer]) :: integer
  def find_middle_index(nums) do
    pos_sum = Enum.reverse(nums) |> Enum.scan(&Kernel.+/2) |> Enum.reverse()
    Enum.scan(nums, &Kernel.+/2)
      |> Enum.zip(pos_sum) 
      |> Enum.find_index(fn {a, b} -> a == b end) || -1
  end
end