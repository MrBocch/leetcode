defmodule Solution do
  @spec asteroid_collision(asteroids :: [integer]) :: [integer]
  def asteroid_collision(asteroids) do
    solver(asteroids, [])
  end
  @spec solver(asteroids :: [integer], stack :: [integer]) :: [integer]
  defp solver([], stack), do: Enum.reverse(stack)
  defp solver([x | xs], []), do: solver(xs, [x])
  defp solver([x | xs], [sx | sxs]) when x > 0 or sx < 0,  do: solver(xs, [x, sx | sxs]) 
  defp solver([x | xs], [sx | sxs]) when abs(x) < sx,  do: solver(xs, [sx | sxs])
  defp solver([x | xs], [sx | sxs]) when abs(x) == sx, do: solver(xs, sxs)
  defp solver([x | xs], [sx | sxs]) when abs(x) > sx,  do: solver([x|xs], sxs)
end