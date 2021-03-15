## Repo cambiar name
defmodule PersonMock do
  import Nontinuum.HelperPerson
  defstruct [:pid, :conn]
  use GenServer

  def create(conn) do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    # {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/admin")
    %PersonMock{pid: pid, conn: conn}
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create, map, conn}, _, {id, _}) do
    new_user = create_person(conn, map)
    new_id = id + 1
    state = {new_id, %{}}
    {:reply, new_user, state}
  end

  @impl true
  def handle_call({:delete, map, conn}, _, {id, _}) do
    map = %{uuid: map}
    delete_p = delete_person(conn, map)
    new_id = id + 1
    state = {new_id, %{}}
    {:reply, delete_p, state}
  end
end
