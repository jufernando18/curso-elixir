defmodule Exercises2 do
  def fibonacci(n) do
    case n  do
      0 -> 0
      1 -> 1
      _ -> fibonacciSerie(n, 2, [1, 0])
    end
  end
  defp fibonacciSerie(limit, n, [recent, old]) do
    current = recent + old
    if (limit == n) do
      current
    else
      fibonacciSerie(limit, n + 1, [current, recent])
    end
  end

  def fibonacciOptimo(n) when n > 1, do: fibonacciOptimo(n-1) + fibonacciOptimo(n-2)
  def fibonacciOptimo(1), do: 1
  def fibonacciOptimo(0), do: 0

  def trianguloPascal(limit) do
    fila = [1]
    IO.inspect(fila)
    if (limit > 1) do
      trianguloPascalSerie(limit, 2, [0] ++ fila ++ [0])
      "That's all"
    end
  end

  defp trianguloPascalSerie(limit, n, fila) do
    fila = calculaFilaTrianguloPascal(fila)
    IO.inspect(fila)
    if (limit != n), do: trianguloPascalSerie(limit, n + 1, [0] ++ fila ++ [0])
  end

  defp calculaFilaTrianguloPascal([_]), do: []

  defp calculaFilaTrianguloPascal([head | tail]) do
    [h | _t] = tail
    head = head + h
    [head] ++ calculaFilaTrianguloPascal(tail)
  end
end
