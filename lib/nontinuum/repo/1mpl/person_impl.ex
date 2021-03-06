defmodule Nontinuum.PersonImpl do
  defstruct [:cc, :name, :last_name, :email, :uuid]

  def new(), do: %Nontinuum.PersonImpl{}

  defimpl Nontinuum.MongoHandler, for: __MODULE__ do
    def create(data, _), do: Nontinuum.HelperPerson.create_person(create_conn(), data)
    def delete(data, _), do: Nontinuum.HelperPerson.delete_person(create_conn(), data)
    def find_all(_, _), do: Nontinuum.HelperPerson.list_person(create_conn())
    def update(_, _), do: :uninplmented

    def create_conn() do
      {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/admin")
      IO.inspect(conn)
    end
  end
end
