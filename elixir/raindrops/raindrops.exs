# defmodule Raindrops do
#   @doc """
#   Returns a string based on raindrop factors.

#   - If the number contains 3 as a prime factor, output 'Pling'.
#   - If the number contains 5 as a prime factor, output 'Plang'.
#   - If the number contains 7 as a prime factor, output 'Plong'.
#   - If the number does not contain 3, 5, or 7 as a prime factor,
#     just pass the number's digits straight through.
#   """
#   @spec convert(pos_integer) :: String.t
#   def convert(number) do
#     res = convert(number, true)
#     if (String.length(res) > 0), do: res, else: Integer.to_string(number)
#   end

#   def convert(number, true) do
#     res = cond do
#       rem(number, 3) == 0 -> "Pling" <> convert(remove_factor(number, 3), true)
#       rem(number, 5) == 0 -> "Plang" <> convert(remove_factor(number, 5), true)
#       rem(number, 7) == 0 -> "Plong" <> convert(remove_factor(number, 7), true)
#       true -> ""
#     end
#   end

#   defp remove_factor(number, factor) do
#     if (rem(number, factor) == 0) do
#       remove_factor(round(number / factor), factor)
#     else
#       number
#     end
#   end
# end

defmodule Raindrops do

  def convert(number) do
    res = %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
    |> Enum.map(&(do_convert(&1, number)))
    |> Enum.join
    if (res == ""), do: Integer.to_string(number), else: res
  end

  defp do_convert({prime, string}, number) do
    if divisble?(number, prime), do: string, else: ""
  end

  defp divisble?(number, prime) do
    rem(number, prime) == 0
  end

end
