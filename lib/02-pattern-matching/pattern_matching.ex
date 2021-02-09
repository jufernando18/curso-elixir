IO.puts "hola mundo"
[a | b] = myList = [1, 2, 3]
#IO.puts myList
IO.inspect(myList, label: "->")
IO.inspect(a, label: "->")
IO.inspect(b, label: "->")

[%{firstname: a} | b] = personas = [
    %{firstname: "Juan", lastname: "Echavarria"},
    %{firstname: "German", lastname: "Echavarria"},
    %{firstname: "John", lastname: "Monsalve"},
    %{firstname: "Sandra", lastname: "Zapata"},
    %{firstname: "Juan", lastname: "Echavarria"}
]

IO.inspect(a, label: "->")
