IO.puts("Hola mundo\n")

IO.puts("===========================")
IO.puts("Texto")
texto = "Soy un Texto"
IO.puts("===========================")
IO.puts("===========================")
IO.puts("Numbers")
IO.puts("===========================")
number=3

number_hex=0xFF

number_oct=0o644
IO.puts("Numbers #{number}, #{number_hex}, #{number_oct}")

float = 3.12
number_scient = 1.0e-10

IO.puts("Numbers #{float}, #{number_scient}")
IO.puts("div(4, 3) =  #{div(4, 3)}")
IO.puts("rem(4, 3) =  #{rem(4, 3)}")
IO.puts("3/4 =  #{3/4}")
IO.puts("3*4 =  #{3*4}")
IO.puts("3+4 =  #{3+4}")

IO.puts("===========================")
IO.puts("Booleans")
IO.puts("===========================")

t= true
f= false

IO.puts("===AND===")
IO.puts("t and f = #{t and f}")
IO.puts("t and t = #{t and t}")
IO.puts("f and f = #{f and f}")
IO.puts("f and t = #{f and f}")

IO.puts("===OR===")
IO.puts("t or f = #{t or f}")
IO.puts("t or t = #{t or t}")
IO.puts("f or f = #{f or f}")
IO.puts("f or t = #{f or f}")
list= [1,"2",:hola,4]
tuple= {1,"2",:hola,4}
map= {1,"2",:hola,4}
map2= %{a: 1, b: "2", c: :hola, d: 4}
map3= %{"a" => 1, "b" => "2", "c" => :hola, "d" => 4}
IO.puts("===functions===")
IO.puts("is_boolean(t) = #{is_boolean(t)}")
IO.puts("is_number(number) = #{is_number(number)}")
IO.puts("is_number(float) = #{is_number(float)}")
IO.puts("is_float(float) = #{is_number(float)}")
IO.puts("is_binary(texto) = #{is_binary(texto)}")
IO.puts("is_list(list) = #{is_list(list)}")
IO.puts("is_map(map) = #{is_map(map)}")
IO.puts("is_map(map2) = #{is_map(map2)}")
IO.puts("is_map(map3) = #{is_map(map3)}")
