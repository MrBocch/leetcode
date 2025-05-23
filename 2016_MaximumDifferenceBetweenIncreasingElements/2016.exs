defmodule Solution do
  @spec maximum_difference(nums :: [integer]) :: integer
  def maximum_difference(nums) do
    [min | tail] = nums 

    solver(min, tail, -1)
  end

  # haskell like pattern matching SO KOOL
  def solver(min, [], maxDiff), do: maxDiff
  def solver(min, nums, maxDiff) do 
    [head | tail] = nums 

    if min >= head do 
      solver(head, tail, maxDiff)
    else 
      curDiff = head - min 
      solver(min, tail, max(maxDiff, curDiff))
    end
  end 
end