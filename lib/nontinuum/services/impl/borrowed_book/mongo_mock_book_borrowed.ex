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
    new_id = id + 1
    if Enum.count(books_borrowed) < map.numberOfTotalCopies do
      new_map = {map.uuid, map.uuidBook, map.uuidPerson}
      books_borrowed = Map.put(books_borrowed, new_id, new_map)
      state = {new_id, books_borrowed}
      {:reply, "Asignado", state}
    else
      state = {id, books_borrowed}
      {:reply, "No Asignado", state}
    end
  end
end
