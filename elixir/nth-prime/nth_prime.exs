defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0) do raise "Error" end
  def nth(count) do
    primes = find_primes([], count)
    Enum.at(primes, 0)
  end

  defp find_primes(primes, count) do
    primes = [ find_next_prime(primes) | primes ]
    if (length(primes) == count) do
      primes
    else
      find_primes(primes, count)
    end
  end

  def find_next_prime([]) do 2 end
  def find_next_prime([2]) do 3 end
  def find_next_prime(prev_primes, last_maybe_prime \\ nil) do
    maybe_prime = (last_maybe_prime || hd(prev_primes)) + 2
    if (is_prime?(maybe_prime, prev_primes)) do
      maybe_prime
    else
      find_next_prime(prev_primes, maybe_prime)
    end
  end

  def is_prime?(maybe_prime, prev_primes) do
    prev_primes
    |> Enum.map(fn prime ->
      rem(maybe_prime, prime) > 0
    end)
    |> Enum.all?
  end


end
