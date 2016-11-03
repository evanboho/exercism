defmodule Scrabble do
  @one_point ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
  @two_points ["D", "G"]
  @three_points ["B", "C", "M", "P"]
  @four_points ["F", "H", "V", "W", "Y"]
  @five_points ["K"]
  @eight_points ["J", "X"]
  @ten_points ["Q", "Z"]

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score("") do 0 end
  def score(word) do
    word
    |> String.upcase
    |> String.graphemes
    |> Enum.reduce(0, fn(x, acc) -> calc_letter_score(x) + acc end)
  end

  defp calc_letter_score(ltr) when ltr in @one_point do 1 end
  defp calc_letter_score(ltr) when ltr in @two_points do 2 end
  defp calc_letter_score(ltr) when ltr in @three_points do 3 end
  defp calc_letter_score(ltr) when ltr in @four_points do 4 end
  defp calc_letter_score(ltr) when ltr in @five_points do 5 end
  defp calc_letter_score(ltr) when ltr in @eight_points do 8 end
  defp calc_letter_score(ltr) when ltr in @ten_points do 10 end
  defp calc_letter_score(l) do 0 end
end
