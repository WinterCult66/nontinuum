defmodule MongoTest do
  use ExUnit.Case

  test "Create Person" do

    #expected = %Person{cc: 1, name: "Kevin"}
    #expected = DataMocked.person
    #handler = MongoDBMock.new
    #new_user = MongoProtocol.find_person(handler, %{name: "Kevin"})
    #IO.inspect(expected)
    #IO.inspect(new_user)

    handler = MongoDBMock.new
    person =    %Nontinuum.PersonMockImpl{cc: 123456789, name: "Kevin1", last_name: "Rodriguez",email: "kevin@rodrigyez.net", uuid: UUID.uuid1()}
    new_person = Nontinuum.MongoHandler.create(person, handler)


    person =    %Nontinuum.PersonMockImpl{cc: 123456789, name: "Kevin2", last_name: "Rodriguez",email: "kevin@rodrigyez.net", uuid: UUID.uuid1()}
    new_person = Nontinuum.MongoHandler.create(person, handler)


    person =    %Nontinuum.PersonMockImpl{cc: 123456789, name: "Kevin3", last_name: "Rodriguez",email: "kevin@rodrigyez.net", uuid: UUID.uuid1()}
    new_person = Nontinuum.MongoHandler.create(person, handler)



    IO.inspect(new_person)

    assert true
  end

end
