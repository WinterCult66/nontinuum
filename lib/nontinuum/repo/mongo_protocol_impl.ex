defimpl MongoHandler, for: MongoHandler do
  def create(handler, person) do
    GenServer.call(handler.conn, {:create, person})
  end
end
