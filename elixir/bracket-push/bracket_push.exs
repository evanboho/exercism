defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets("") do true end
  def check_brackets(str) do
    check(String.split(str, ""), []) == []
  end

  defp check([], acc) do acc end
  defp check(_, false) do false end
  defp check([head | tail], acc) do
    acc =
      case head do
        "{" -> open_parens("{", acc)
        "[" -> open_parens("[", acc)
        "(" -> open_parens("(", acc)
        "}" -> close_parens("{", acc)
        "]" -> close_parens("[", acc)
        ")" -> close_parens("(", acc)
        _ -> acc
      end
    check(tail, acc)
  end

  def open_parens(sym, []) do [{ sym, 1 }] end
  def open_parens(sym, [{ acc_sym, acc_n } | tail_acc]) when sym == acc_sym do
    [{ acc_sym, acc_n + 1 } | tail_acc]
  end
  def open_parens(sym, acc) do
    [{ sym, 1 } | acc]
  end

  defp close_parens(sym, [{ acc_sym, acc_n } | tail_acc]) when sym == acc_sym and acc_n == 1 do
    tail_acc
  end
  defp close_parens(sym, [{ acc_sym, acc_n } | tail_acc]) when sym == acc_sym do
    [{ acc_sym, acc_n - 1 } | tail_acc]
  end
  defp close_parens(sym, [{ acc_sym, acc_n }]) when sym == acc_sym do
    []
  end
  defp close_parens(sym, _) do false end

end
