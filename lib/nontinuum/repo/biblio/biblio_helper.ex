defmodule Nontinuum.HelperBiblio do
  @table "biblio"

  def create_biblio(conn, biblio) do
    Mongo.insert_one(conn, @table, biblio)
  end

  def delete_biblio(conn, attrs \\ %{}) do
    Mongo.delete_one(conn, @table, attrs)
  end

  def update_biblio(conn, attrs \\ %{}, set) do
    Mongo.update_one!(conn, @table, attrs, set)
  end

  def list_biblio(conn) do
    cursor = Mongo.find(conn, @table, %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect()
  end
end
