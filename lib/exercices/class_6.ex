defmodule Exercises6 do
  @spec reduce(binary) :: bitstring
  def reduce(string) when is_binary(string) do
    string_as_list = String.codepoints(string)
    reduce_intern(tl(string_as_list), hd(string_as_list))
  end

  defp reduce_intern([], reduced), do: reduced

  defp reduce_intern([head | tail], reduced) do
    if head not in String.codepoints(reduced) do
      reduce_intern(tail, reduced <> head)
    else
      reduce_intern(tail, reduced)
    end
  end

  #Solución de otro compañero que fue puesta como la mejor solución
  def reduction(n),  do: reductionp(String.codepoints(n))

  defp reductionp(_, list \\ [])

  defp reductionp([], list),  do: Enum.join(list)

  defp reductionp([head | tail], list)  do
      result =
          cond do
              head in list -> list
              head not in list -> list ++ [head]
          end
      reductionp(tail, result)
  end
  #Hasta acá

  def overlap(string_l, string_r) do
    overlap_intern(String.codepoints(string_l), String.codepoints(string_r))
  end

  defp overlap_intern(string_l, string_r, overlaped \\ "") do
    case {string_l, string_r} do
      {[], []} -> overlaped
      {[], [r]} -> overlaped <> r
      {[], [r | tail_r]} -> overlap_intern([], tail_r, overlaped <> r)
      {[l], []} -> overlaped <> l
      {[l | tail_l], []} -> overlap_intern(tail_l, [], overlaped <> l)
      {[l], [r]} -> overlaped <> l <> r
      {[l | tail_l], [r | tail_r]} -> overlap_intern(tail_l, tail_r, overlaped <> l <> r)
    end
  end
end
