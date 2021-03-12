defmodule MongoDB do
  defstruct [:pid, :conn]
  use GenServer

  def create() do
    {:ok, pid} = GenServer.start_link(__MODULE__, {0, %{}})
    {:ok, conn} = create_conn()
    %MongoDB{pid: pid, conn: conn}
  end

  @impl true
  def init(state), do: {:ok, state}

  # @impl true
  # def handle_cast({:create, person}, conn) do
  #   result = Nontinuum.HelperPerson.create_person(conn, person)
  #   {:noreply, result}
  # end

  @impl true
  def handle_call({:create, person}, _, {_, new_person}) do
    new_person = Nontinuum.HelperPerson.create_person(:conn, person)
    state = {55, new_person}
    {:reply, new_person}
  end

  def create_conn(),  do: Mongo.start_link(url: "mongodb://localhost:27017/admin")
end
