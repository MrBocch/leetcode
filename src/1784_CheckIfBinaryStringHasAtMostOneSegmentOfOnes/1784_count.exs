defmodule Solution do
  @spec check_ones_segment(s :: String.t) :: boolean
  def check_ones_segment(s) do
    s |> String.contains?("01") |> Kernel.not()
  end
end