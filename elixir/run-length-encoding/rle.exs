defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.graphemes
    |> Enum.chunk_by(&(&1))
    |> Enum.map(&("#{Enum.count(&1)}#{Enum.at(&1, 0)}"))
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode("") do "" end
  def decode(string) do
    { count, <<ltr>> <> tail } = Integer.parse(string)
    String.duplicate(<<ltr>>, count) <> decode(tail)
  end
end
