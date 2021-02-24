defmodule Exercises13 do
  def customized_order_1(string) do
    cond do
      not is_binary(string) -> {:error, "Input is not valid. Should be a string."}
      true -> customized_order(string, "c")
    end
  end

  def customized_order_2(string) do
    cond do
      not is_binary(string) -> {:error, "Input is not valid. Should be a string."}
      true -> customized_order(string, "a")
    end
  end

  def customized_order(string, split_by) do
    string |> String.split(split_by) |> Enum.map_join(split_by, &(&1 |> String.codepoints |> Enum.sort |> Enum.join))
  end

  def customized_order_optimized(string, split_by) do
    string |> String.codepoints |> Enum.chunk_by(&(&1 == split_by)) |> Enum.map_join(&(Enum.sort(&1)))
  end
end
