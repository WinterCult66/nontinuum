# defmodule Nontinuum.BookImpl do
#   defstruct [:name, :description, :genre]

#   def new(), do: %Nontinuum.BookImpl{}

#   defimpl Nontinuum.MongoHandler, for: __MODULE__ do
#     def create(data), do: Nontinuum.HelperBook.create_book(create_conn(), data)
#     def delete(data), do: Nontinuum.HelperBook.delete_book(create_conn(), data)
#     def find_all(_), do: Nontinuum.HelperBook.list_book(create_conn())
#     def update(_, _), do: :uninplmented

#     def create_conn() do
#       {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/admin")
#       IO.inspect(conn)
#     end
#   end
# end
