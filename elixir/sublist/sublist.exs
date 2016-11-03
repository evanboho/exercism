defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, b) do
    cond do
      a == b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(a, b) when length(a) > length(b) do false end
  defp sublist?(_, []) do false end
  defp sublist?([], _) do true end
  defp sublist?([head_a | tail_a], [head_b | tail_b]) when head_a === head_b do
    cond do
      tail_a === Enum.take(tail_b, length(tail_a)) -> true
      true -> sublist?([head_a | tail_a], tail_b)
    end
  end
  defp sublist?(a, [head_b | tail_b]) do sublist?(a, tail_b) end

end
