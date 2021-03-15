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
    new_id = id + 1
    new_user = map
    users = Map.put(users, new_id, new_user)
    state = {new_id, users}
    {:reply, new_user, state}
  end
end
