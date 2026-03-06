defmodule Solution do
  @spec check_ones_segment(s :: String.t) :: boolean
  def check_ones_segment(s) do
    s |> String.split("0", trim: true) |> Enum.count() == 1
  end
end