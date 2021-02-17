defmodule Exercises8 do
  def string_compress(string, compressed \\ "") when is_binary(string) do
    string_compress_intern(String.codepoints(string), compressed)
  end

  defp string_compress_intern([], compressed), do: compressed
  defp string_compress_intern([head | _tail] = list, compressed) do
    compressed = compressed <> head
    {list_rem, repeats} = compress(list)
    if repeats > 1 do
      string_compress_intern(list_rem, compressed <> "#{repeats}")
    else
      string_compress_intern(list_rem, compressed)
    end
  end

  defp compress(_, count \\ 1)
  defp compress([], count), do: {[], count}
  defp compress([head | tail], count) do
    if tail != [] and head == hd(tail) do
      compress(tail, count + 1)
    else
      {tail, count}
    end
  end

  def string_compress_optimized(string) when is_binary(string) do
    string |> String.codepoints |> Enum.chunk_by(&(&1)) |> Enum.map(fn section ->
        length = length(section)
        if length > 1 do
          hd(section) <> "#{length}"
        else
          hd(section)
        end
      end) |> Enum.join()
  end

  def chunck_2_reverse(string) when is_binary(string) do
    string
    |> String.codepoints
    |> Enum.chunk_every(2)
    |> Enum.map(fn section -> Enum.reverse(section) end)
    |> Enum.join()
  end

  def super_digit(number) when number < 10, do: number
  def super_digit(number), do: number |> Integer.digits |> sum_numbers |> super_digit

  defp sum_numbers(_, acum \\ 0)
  defp sum_numbers([], acum), do: acum
  defp sum_numbers([head | tail], acum), do: sum_numbers(tail, acum + head)
end
