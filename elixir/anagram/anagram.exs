defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base = String.downcase(base)
    sorted_base = sort(base)

    candidates
    |> Enum.filter(fn x ->
      String.downcase(x) != base && sort(x) == sorted_base
    end)
  end

  defp sort(word) do
    word
    |> String.downcase
    |> String.split("")
    |> Enum.sort
    |> Enum.join
  end
end
