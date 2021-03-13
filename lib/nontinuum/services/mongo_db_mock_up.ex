
 defimpl MongoProtocol , for: MongoDBMock do
    def find_person(handler, %{name: _} = map) do
      GenServer.call(handler.pid, {:find_person, map})
    end

    # def find_user(handler, id) do
    #   GenServer.call(handler.pid, {:find_user, id})
    # end
  end
