defmodule CursoElixir do
  @personas [
    %{firstname: "Juan", lastname: "Echavarria"},
    %{firstname: "German", lastname: "Echavarria"},
    %{firstname: "John", lastname: "Monsalve"},
    %{firstname: "Sandra", lastname: "Zapata"},
    %{firstname: "Juan", lastname: "Echavarria"}]

  @numeros [1, 2, 3, 4, 5, 6]

    def buscar([%{firstname: _a} | _b] = @personas) do

    end

    def buscarRecursive([head | tail] = @personas) do
      IO.inspect(head, label: "---->")
      buscarRecursive(tail)
    end

    def buscarOtherWay([]), do: "No hay más items"

#    def buscarOtherWay([head | tail] = _list \\ @personas) do
#      IO.inspect(head, label: "---->")
#      buscarOtherWay(tail)
#    end
#    def buscarOtherWay([%{firstname: nombre} | tail] = _list \\ @personas) do
#      IO.inspect(nombre, label: "Hola, mi nombre es")
#      buscarOtherWay(tail)
#    end

    def buscarOtherWay([%{firstname: nombre, lastname: apellido} | tail] = _list \\ @personas) do
      IO.puts "Hola, mi nombre es #{nombre} #{apellido}"
      buscarOtherWay(tail)
    end

    def sumar([], suma), do: suma

    def sumar([head | tail] \\ @numeros, suma \\ 0) do
      resultado = suma + head
      sumar(tail, resultado)
    end

    def generico([], suma, _funcion), do: suma

    #CursoElixir.generico(fn (a, b) -> a * b end)
    #CursoElixir.generico(&(&1 + &2))
    def generico([head | tail] \\ @numeros, suma \\ 0, funcion) do
      resultado = funcion.(suma, head)
      generico(tail, resultado, funcion)
    end

    def buscarNombres() do
      Enum.map(@personas, fn (tupla) -> "Hola, mi nombre es #{tupla.firstname} #{tupla.lastname}" end)
    end

    #Enum.map(1..10, &(&1 * 2))

    def search([], _find), do: false

    def search([head | tail], find) do
      if (head == find) do
        true
      else
        search(tail, find)
      end
    end

    def count([], length), do: length

    def count([_head | tail], length \\ 0), do: count(tail, length + 1)

    def concat([], _separator, join), do: join

    def concat([head | tail], separator \\ ",", join \\ "") do
      if (is_binary(head) == false) do
        IO.puts "#{head} no es un string. Se ignora."
        concat(tail, separator, join)
      else
        concat(tail, separator, head <> separator <> join)
      end
    end
end
