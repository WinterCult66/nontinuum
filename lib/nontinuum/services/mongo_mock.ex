defmodule MongoDBMock do
  defstruct [:pid]
  use GenServer

  def new() do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    %MongoDBMock{pid: pid}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:find_person, map}, _, {user_id, users}) do
    IO.inspect("FRom HANDLECALLLLLLLLL=[>>>>>>>>>>>>>>>>")
    IO.inspect(map)
    new_id = user_id + 1
    new_user = map
    users = Map.put(users, new_id, new_user)
    state = {new_id, users}

    IO.inspect("xxxxxxxxxxxxxxxxxxxxxxxxx>>>>>>>>>>>>>>>>")
    IO.inspect(users)
    {:reply, new_user, state}
  end
end
