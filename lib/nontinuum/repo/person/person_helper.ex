defmodule Nontinuum.HelperPerson do
  @table "person"

  def create_person(conn, person) do
    Mongo.insert_one(conn, @table, person)
  end

  def delete_person(conn, attrs \\ %{}) do
    Mongo.delete_one(conn, @table, attrs)
  end

  def update_person(conn, attrs \\ %{}, set) do
    Mongo.update_one!(conn, @table, attrs, set)
  end

  def list_person(conn) do
    cursor = Mongo.find(conn, @table, %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect()
  end

  def print() do
    IO.inspect(">>>>>>>>>>>>>>>>>>>>>")
  end
end
