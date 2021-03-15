defmodule MongoDBMockPerson do
  defstruct [:pid]
  use GenServer

  def new() do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    %MongoDBMockPerson{pid: pid}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create, map}, _, {id, users}) do
    persons = Map.put(users, id, map)
    state = {id, persons}
    {:reply, map, state}
  end
end
