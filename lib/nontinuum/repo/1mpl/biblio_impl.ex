defmodule Nontinuum.BiblioImpl do
  defstruct [:name, :ubication]

  def new(), do: %Nontinuum.BiblioImpl{}

  defimpl Nontinuum.MongoHandler, for: __MODULE__ do
    def create(data), do: Nontinuum.HelperBiblio.create_biblio(create_conn(), data)
    def delete(data), do: Nontinuum.HelperBiblio.delete_biblio(create_conn(), data)
    def find_all(_), do: Nontinuum.HelperBiblio.list_biblio(create_conn())
    def update(_, _), do: :notimplemented

    def create_conn() do
      {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/admin")
      IO.inspect(conn)
    end
  end
end
