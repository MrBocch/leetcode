defmodule Solution do
  @spec find_closest(x :: integer, y :: integer, z :: integer) :: integer
  def find_closest(x, y, z) when abs(z-y) > abs(z-x), do: 1
  def find_closest(x, y, z) when abs(z-x) > abs(z-y), do: 2
  def find_closest(_,_,_),                            do: 0
end