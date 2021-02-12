defmodule Exercises3 do

  def secuentialSum(n, result \\ 0) do
    cond do
      is_integer(n) == false or n < 0 -> {:error, "'#{n}' is not valid value. Should be an integer >= 0."}
      n == 0 -> {:ok, "The sum secuencial result is #{result}"}
      true -> secuentialSum(n-1, result + n)
    end
  end

  def fibo(n) do
    cond do
      is_integer(n) == false or n < 1 -> {:error, "'#{n}' is not valid value. Should be an integer >= 1."}
      n == 1 or n == 2 -> 1
      true -> fibo(n - 1) + fibo(n - 2)
    end
  end

  def fiboOptimized(n) when is_integer(n) and n > 0, do: fiboOptim(n, 0, 1)

  defp fiboOptim(1, _, b), do: b

  defp fiboOptim(n, a, b), do: fiboOptim(n - 1, b, a + b)

  def some(a, b) do
    cond do
      is_integer(a) == false or is_integer(b) == false -> {:error, "'#{a}' or/and '#{b}' are not valid value. Should be an integers."}
      a == 0 or b == 0 -> 0
      a == b -> some(a - 1, b - 1) + 2 * a - 1
      a > b -> some(a - b, b) + some(b, b)
      a < b -> some(a, a) + some(b - a, a)
    end
  end

  def gcd(a, b) do
    cond do
      is_integer(a) == false or is_integer(b) == false -> {:error, "'#{a}' or/and '#{b}' are not valid value. Should be an integers."}
      b == 0 -> a
      b > a -> gcd(b, a)
      true -> gcd(a - b, b)
    end
  end
end
