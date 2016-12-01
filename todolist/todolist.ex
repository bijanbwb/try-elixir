defmodule TodoList do
  @moduledoc """

  ## Features

  - Create a new data abstraction.
  - Add new entries with `TodoList.add_entry/3`.
  - Query for entries with `TodoList.entries/2`.

  ## Example Usage

  ```elixir
  todo_list =
    TodoList.new |>
      TodoList.add_entry({2017, 12, 19}, "Dentist") |>
      TodoList.add_entry({2017, 12, 20}, "Shopping") |>
      TodoList.add_entry({2017, 12, 19}, "Movies")

  TodoList.entries(todo_list, {2013, 12, 19}) #=> ["Movies", "Dentist"]
  TodoList.entries(todo_list, {2013, 12, 20}) #=> ["Shopping"]
  TodoList.entries(todo_list, {2013, 12, 21}) #=> []
  ```  
  """

  @doc """
  Use `TodoList.new` to create a new `HashDict`.
  """
  def new do
    HashDict.new
  end

  @doc """
  Uses `HashDict.update` to push a new todo item to the front of the
  existing todo list with an "updater lambda" function.
  """
  def add_entry(todo_list, date, title) do
    HashDict.update(todo_list, date, [title], fn(titles) -> [title | titles] end)
  end

  @doc """
  Queries for all todo list items by date.
  Defaults to an empty list if nothing is found.
  """
  def entries(todo_list, date) do
    HashDict.get(todo_list, date, [])
  end
end
