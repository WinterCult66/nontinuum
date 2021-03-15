defmodule Nontinuum.PersonMockMongoImpl do
  defstruct [:cc, :name, :last_name, :email, :uuid]

  def new(), do: %Nontinuum.PersonImpl{}

  defimpl Nontinuum.MongoHandler, for: PersonMock  do
    def create(handler, data) do
      GenServer.call(handler.pid, {:create, data, handler.conn})
    end

    def delete(handler, data) do
      GenServer.call(handler.pid, {:delete, data.uuid, handler.conn})
    end

    def find_all(_, _), do: :uninplmented
    def update(_, _), do: :uninplmented
  end
end
