defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets("") do true end
  def check_brackets(str) do
    map = check(String.split(str, ""), %{"{" => 0, "[" => 0, "(" => 0})
    check_map(map)
    # Enum.all?(Map.values(map), fn x -> x == 0 end)
  end

  defp check_map(false) do false end
  defp check_map(map) do
    Enum.all?(Map.values(map), fn x -> x == 0 end)
  end

  defp check([head | tail], acc) do
    case head do
      "{" ->
        acc = []
      "[" ->
        acc = Map.put(acc, "[", acc["["] + 1)
      "(" ->
        acc = Map.put(acc, "(", acc["("] + 1)
      "}" ->
        acc = Map.put(acc, "{", acc["{"] - 1)
      "]" ->
        acc = Map.put(acc, "[", acc["["] - 1)
      ")" ->
        acc = Map.put(acc, "(", acc["("] - 1)
      _ -> true
    end
  end

  # defp check([], acc) do acc end
  # defp check(_, false) do false end
  # defp check([head | tail], acc) do
  #   case head do
  #     "{" ->
  #       acc = Map.put(acc, "{", acc["{"] + 1)
  #     "[" ->
  #       acc = Map.put(acc, "[", acc["["] + 1)
  #     "(" ->
  #       acc = Map.put(acc, "(", acc["("] + 1)
  #     "}" ->
  #       acc = Map.put(acc, "{", acc["{"] - 1)
  #     "]" ->
  #       acc = Map.put(acc, "[", acc["["] - 1)
  #     ")" ->
  #       acc = Map.put(acc, "(", acc["("] - 1)
  #     _ -> true
  #   end
  #   if (Enum.any?(Map.values(acc), fn x -> x < 0 end)) do
  #     acc = false
  #   end
  #   check(tail, acc)
  #   # if length(tail) > 0 do
  #   #   check(tail, acc)
  #   # else
  #   #   acc
  #   # end
  # end
end
