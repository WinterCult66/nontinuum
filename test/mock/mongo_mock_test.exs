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
    person =    %Nontinuum.PersonMockImpl{name: "Kevin1", cc: 104_7142, last_name: "Rodriguez12"}
    new_person = Nontinuum.MongoHandler.create(person, handler)

    
    person =    %Nontinuum.PersonMockImpl{name: "Kevin2", cc: 104_7141, last_name: "Rodriguez13"}
    new_person = Nontinuum.MongoHandler.create(person, handler)


    person =    %Nontinuum.PersonMockImpl{name: "Kevin3", cc: 104_7140, last_name: "Rodriguez47"}
    new_person = Nontinuum.MongoHandler.create(person, handler)



    IO.inspect(new_person)

    assert true
  end

end
