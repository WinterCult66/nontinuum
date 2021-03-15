defmodule Nontinuum.PersonMockImpl do
  defstruct [:name, :cc, :last_name]

  def new(), do: %Nontinuum.PersonImpl{}

  defimpl Nontinuum.MongoHandler, for: __MODULE__ do
    def create(data, handlerx) do
      GenServer.call(handlerx.pid, {:find_person, data})

    end
    def delete(_, _ ), do: :uninplmented
    def find_all( _,_), do: :uninplmented
    def update( _,_,_), do: :uninplmented


  end
end
