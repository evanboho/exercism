defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> multiples(limit)
    |> Enum.uniq
    |> Enum.sum
  end

  defp multiples([], _) do [0] end
  defp multiples([ head | tail ], limit) do
    Enum.concat(multiple(head, limit), multiples(tail, limit))
  end

  defp multiple(factor, limit, i) when factor * i >= limit do [] end
  defp multiple(factor, limit, i \\ 1) do
    [factor * i | multiple(factor, limit, i + 1)]
  end

end
