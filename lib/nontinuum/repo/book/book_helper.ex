defmodule Nontinuum.HelperBook do
  @table "book"

  def create_book(conn, book) do
    Mongo.insert_one(conn, @table, book)
  end

  def delete_book(conn, attrs \\ %{}) do
    Mongo.delete_one(conn, @table, attrs)
  end

  def update_book(conn, attrs \\ %{}, set) do
    Mongo.update_one!(conn, @table, attrs, set)
  end

  def list_book(conn) do
    cursor = Mongo.find(conn, @table, %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect()
  end
end
