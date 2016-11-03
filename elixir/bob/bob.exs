defmodule Bob do
  def hey(input) do
    cond do
        asking?(input) -> "Sure."
        shouting?(input) -> "Whoa, chill out!"
        silence?(input) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end

  def asking?(input) do
    String.ends_with?(input, "?")
  end

  def shouting?(input) do
    String.match?(input, ~r/[[:alpha:]]/) && String.upcase(input) == input
  end

  def silence?(input) do
    String.trim(input) == ""
  end

end
