defmodule Nontinuum.BookMockImpl do
  defstruct [:title, :description, :numberOfTotalCopies, :uuid]

  def new(), do: %Nontinuum.BookImpl{}

  defimpl Nontinuum.MongoHandler, for: __MODULE__ do
    def create(data, handler) do
      GenServer.call(handler.pid, {:create, data})
    end

    def delete(_, _), do: :uninplmented
    def find_all(_, _), do: :uninplmented
    def update(_, _, _), do: :uninplmented
  end
end
