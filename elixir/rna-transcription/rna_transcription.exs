defmodule RNATranscription do
  @map %{ 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna('') do '' end
  def to_rna([h | t]) do
    @map[[h]] ++ to_rna(t)
  end
end
