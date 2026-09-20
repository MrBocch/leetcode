defmodule Solution do
  @spec running_sum(nums :: [integer]) :: [integer]
  def running_sum(nums), do: Enum.scan(nums, &Kernel.+/2) 
end