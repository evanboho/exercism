defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split("")
    |> Enum.filter(fn ltr -> String.match?(ltr, ~r/\w|-| /) end)
    |> Enum.join("")
    |> String.split(~r/( |_)+/)
    |> Enum.reduce(%{}, fn word, acc ->
      Map.put(acc, word, (acc[word] || 0) + 1)
    end)
  end

end
