defmodule Solution do
  @spec my_sqrt(x :: integer) :: integer
  def my_sqrt(x), do: sqrt_iter(x, x/2.0) 

  defguardp good_enough?(x, guess) when abs(guess * guess - x) < 0.01

  @spec sqrt_iter(x :: integer, guess :: float) :: integer
  defp sqrt_iter(x, guess) when good_enough?(x, guess), do: floor(guess) 
  defp sqrt_iter(x, guess), do: sqrt_iter(x, improve(x, guess))

  @spec improve(x :: integer, guess :: float) :: float
  defp improve(x, guess), do: ((x/ guess) + guess) / 2
end