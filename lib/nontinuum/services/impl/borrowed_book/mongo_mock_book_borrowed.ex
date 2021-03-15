defmodule MongoDBMockBookBorrowed do
  defstruct [:pid]
  use GenServer

  def new() do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    %MongoDBMockBookBorrowed{pid: pid}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create, map}, _, {id, books_borrowed}) do
    IO.inspect("entro a los libros MongoDBMockBookBorrowed")
    books_borrowed = Map.put(books_borrowed, id, map)
    state = {id, books_borrowed}
    {:reply, map, state}
  end
end
