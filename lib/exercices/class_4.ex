defmodule Exercises4 do
  def printBinary(n, iterator \\ 0) do
    cond do
      is_number(n) == false or n < 1 -> {:error, "'#{n}' is not valid. Should be a integer > 0"}
      iterator < n ->
        iterator = iterator + 1
        calcRow(iterator, rem(iterator, 2), [rem(iterator, 2)])
        printBinary(n, iterator)
      true -> {:ok, "That's all."}
    end
  end

  defp calcRow(1, _, list), do: IO.inspect(list)
  defp calcRow(m, toogle, list) do
    toogle = rem(toogle + 1, 2)
    calcRow(m - 1, toogle, list ++ [toogle])
  end

  @spec sumList(list :: list(number()), acum :: number()) :: number()
  def sumList(list, acum \\ 0) when is_list(list) and length(list) > 0 do
    if length(list) > 1 do
      sumList(tl(list), hd(list) + acum)
    else
      [last] = list
      last + acum
    end
  end

  def reverse(list, reverseList \\ []) do
    if length(list) == 0 do
      reverseList
    else
      [head | tail] = list
      reverse(tail, [head] ++ reverseList)
    end
  end

  @spec verifyIfAsc?(list() ,boolean()) :: boolean()
  def verifyIfAsc?(list, equal \\ true) do
    cond do
      is_list(list) == false  or length(list) == 0 -> {:error, "'#{list}' is not valid. Should be a list with elements."}
      not equal -> false
      length(list) == 1 -> true
      true ->
        [head | tail] = list
        verifyIfAsc?(tail, head <= hd(tail))
    end
  end
end
