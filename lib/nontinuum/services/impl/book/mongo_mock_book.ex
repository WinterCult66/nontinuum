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
    IO.inspect("entro a los libros")
    books = Map.put(books, id, map)
    state = {id, books}
    {:reply, map, state}
  end
end
