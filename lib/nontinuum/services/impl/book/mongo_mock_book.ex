defmodule MongoDBMockBook do
  defstruct [:pid]
  use GenServer

  def new() do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    %MongoDBMockBook{pid: pid}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create, map}, _, {id, books}) do
    new_id = id + 1
    new_user = map
    books = Map.put(books, new_id, new_user)
    state = {new_id, books}
    {:reply, new_user, state}
  end
end
