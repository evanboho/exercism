defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  @map Enum.reduce(@nucleotides, %{}, fn n, acc ->
    Map.put(acc, n, 0)
  end)

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    histogram(strand)[nucleotide]
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(strand, @map, &incr_nucleotide/2)
  end

  @spec incr_nucleotide(char, map) :: map
  def incr_nucleotide(n, map) do
    Map.put(map, n, map[n] + 1)
  end
end
