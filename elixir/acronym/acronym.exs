defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split("")
    |> take_first_or_upcase
    |> String.upcase
  end

  defp take_first_or_upcase(list, acc \\ "", prev \\ " ")
  defp take_first_or_upcase([head | tail], acc, prev) do
    tail_acc = take_first_or_upcase(tail, acc, head)
    cond do
      String.match?(head, ~r/[A-Z]/) -> head <> tail_acc
      prev == " " -> head <> tail_acc
      true -> tail_acc
    end
  end
  defp take_first_or_upcase([], _, _) do
    ""
  end
end
