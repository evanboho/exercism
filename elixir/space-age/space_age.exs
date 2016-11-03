defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    case planet do
      :mercury ->
        seconds / 7_600_400
      :venus ->
        seconds / 19_410_000
      :earth ->
        seconds / 31_558_000
      :mars ->
        seconds / 59_360_000
      :jupiter ->
        seconds / 375_000_000
      :saturn ->
        seconds / 930_000_000
      :uranus ->
        seconds / 2_650_000_000
      :neptune ->
        seconds / 5_200_000_000
      _ ->
        raise "Planet not found"
    end
  end
end
