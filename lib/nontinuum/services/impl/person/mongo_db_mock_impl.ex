defmodule Nontinuum.PersonMockImpl do
  defstruct [:cc, :name, :last_name, :email, :uuid]

  def new(), do: %Nontinuum.PersonImpl{}

  defimpl Nontinuum.MongoHandler, for: MongoDBMockPerson do
    def create(handler, data) do
      GenServer.call(handler.pid, {:create, data})
    end

    def delete(_, _), do: :uninplmented
    def find_all(_, _), do: :uninplmented
    def update(_, _), do: :uninplmented
  end
end
