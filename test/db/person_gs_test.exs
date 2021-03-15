## si el repositorio es para un handler debe estar en la primer posicion
defmodule PersonGSTest do
  use ExUnit.Case

  test "Create Person in DB" do
    {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/admin")
    handler = PersonMock.create(conn)

    person = %Nontinuum.PersonMockMongoImpl{
      cc: Util.generate_number_random(),
      name: "Kevin1",
      last_name: "Rodriguez",
      email: "kevin@rodrigyez.net",
      uuid: UUID.uuid1()
    }

    ############
    person_create = Nontinuum.MongoHandler.create(handler, person)

    {:ok, %Mongo.InsertOneResult{acknowledged: acknowledged, inserted_id: _inserted_id}} =
      person_create

    assert acknowledged

    person_delete = Nontinuum.MongoHandler.delete(handler, person)
    {:ok, %Mongo.DeleteResult{acknowledged: acknowledged, deleted_count: count}} = person_delete
    assert acknowledged and count == 1
  end
end
