defimpl MongoHandler, for: MongoHandler do
  def create( person) do
    IO.inspect(person)
    #GenServer.call(handler.conn, {:create, person})
  end
end
