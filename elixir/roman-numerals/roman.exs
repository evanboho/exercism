defmodule Roman do
  @dict %{ 1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M" }
  @keys Map.keys(@dict)
  @tens [1000, 100, 10, 1]
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(0) do "" end
  def numerals(number) do
    number
    |> parse_tens
    |> Enum.map(&get_numerals/1)
    |> Enum.join
  end

  defp get_numerals(0) do "" end
  defp get_numerals(tens) when tens in @keys do @dict[tens] end
  defp get_numerals(tens) do
    biggest_key = extract_biggest(tens)
    next_key = get_next_key(biggest_key)

    biggest_tens = get_biggest_tens(tens)
    if (next_key && next_key - tens == biggest_tens) do
      "#{@dict[biggest_tens]}#{@dict[next_key]}"
    else
      @dict[biggest_key] <> get_numerals(tens - biggest_key)
    end
  end

  defp parse_tens(number, divisor \\ 1000)
  defp parse_tens(number, divisor) when divisor == 1 do [number] end
  defp parse_tens(number, divisor) do
    d = div(number, divisor)
    if (d == 0) do
      parse_tens(number, trunc(divisor / 10))
    else
      extract = d * divisor
      [ extract | parse_tens(number - extract, trunc(divisor / 10)) ]
    end
  end

  defp extract_biggest(number) do
    Enum.reduce(keys, 1, fn (k, acc) ->
      if (k < number), do: k, else: acc
    end)
  end

  defp get_next_key(key) do
    idx = Enum.find_index(keys, fn k -> k == key end)
    Enum.at(keys, idx + 1)
  end

  defp get_biggest_tens(tens) do
    @tens
    |> Enum.reverse
    |> Enum.reduce(fn(ten, acc) ->
      if (tens > ten), do: ten, else: acc
    end)
  end

  defp keys do
    @dict
    |> Map.keys
    |> Enum.sort
  end
end
