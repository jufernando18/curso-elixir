defmodule Exercises7 do
  @url "https://rickandmortyapi.com/api/"

  def start_link do
    Task.start_link(fn -> loop(%{}) end) # {:ok, pid}
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end

  def consumer_character(id \\ nil, response \\ nil)

  def consumer_character(id, response) when is_nil(id) do
    cond do
      response == nil -> consumer(@url <>  "character", fn response -> consumer_character(nil, response) end)
      true ->
        %{"results" => results} = response
        results |> Enum.map(fn %{"id" => id, "name" => name, "url" => url} -> %{"id" => id, "name" => name, "url" => url} end)
    end
  end

  def consumer_character(id, response) do
    cond do
      response == nil -> consumer(@url <>  "character/#{id}", fn response -> consumer_character(id, response) end)
      true ->
        %{"id" => id, "name" => name, "url" => url, "location" => location, "episode" => episode} = response
        %{"id" => id, "name" => name, "url" => url, "location" => location, "episode" => episode}
    end
  end

  def consumer_episode(id \\ nil, response \\ nil)

  def consumer_episode(id, response) when is_nil(id) do
    cond do
      response == nil -> consumer(@url <>  "episode", fn response -> consumer_episode(nil, response) end)
      true ->
        %{"results" => results} = response
        results |> Enum.map(fn %{"id" => id, "name" => name, "url" => url} -> %{"id" => id, "name" => name, "url" => url} end)
    end
  end

  def consumer_episode(id, response) do
    cond do
      response == nil -> consumer(@url <>  "episode/#{id}", fn response -> consumer_episode(id, response) end)
      true ->
        %{"id" => id, "name" => name, "url" => url, "episode" => episode, "characters" => characters} = response
        %{"id" => id, "name" => name, "url" => url, "episode" => episode, "characters" => characters}
    end
  end

  def consumer_location(id \\ nil, response \\ nil)

  def consumer_location(id, response) when is_nil(id) do
    cond do
      response == nil -> consumer(@url <>  "location", fn response -> consumer_location(nil, response) end)
      true ->
        %{"results" => results} = response
        results |> Enum.map(fn %{"id" => id, "name" => name, "url" => url} -> %{"id" => id, "name" => name, "url" => url} end)
    end
  end

  def consumer_location(id, response) do
    cond do
      response == nil -> consumer(@url <>  "location/#{id}", fn response -> consumer_location(id, response) end)
      true ->
        %{"id" => id, "name" => name, "url" => url, "dimension" => dimension, "residents" => residents} = response
        %{"id" => id, "name" => name, "url" => url, "dimension" => dimension, "residents" => residents}
    end
  end

  def consumer(url, callback) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        callback.(Poison.decode!(body))
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
