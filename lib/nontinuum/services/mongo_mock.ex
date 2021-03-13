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
  def handle_call({:find_person, %{name: name}}, _, {user_id, users}) do
    new_id = user_id + 1
    new_user = %Person{cc: new_id, name: name, last_name: "rodriguez"}
    users = Map.put(users, new_id, new_user)
    state = {new_id, users}
    {:reply, new_user, state}
  end





end
