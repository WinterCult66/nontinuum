defmodule Nontinuum.PersonMockImpl do
  defstruct [:cc, :name, :last_name, :email, :uuid]

  def new(), do: %Nontinuum.PersonImpl{}

  defimpl Nontinuum.MongoHandler, for: __MODULE__ do
    def create(handler, data) do
      GenServer.call(data.pid, {:create, handler})
    end

    def delete(_, _), do: :uninplmented
    def find_all(_, _), do: :uninplmented
    def update(_, _), do: :uninplmented
  end
end
