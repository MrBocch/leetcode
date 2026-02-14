defmodule Solution do
  @spec is_acronym(words :: [String.t], s :: String.t) :: boolean
  def is_acronym(words, s) do
    words 
      |> Enum.map(&String.first/1) 
      |> Enum.join()
      |> Kernel.==(s) 

  end
end