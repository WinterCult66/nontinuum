defmodule MongoTest do
  use ExUnit.Case

  test "Validation list Persons" do
    handler = MongoDBMockPerson.new()

    person = %Nontinuum.PersonMockImpl{
      cc: Util.generate_number_random(),
      name: "Kevin1",
      last_name: "Rodriguez",
      email: "kevin@rodrigyez.net",
      uuid: UUID.uuid1()
    }

    new_person = Nontinuum.MongoHandler.create(handler, person)
    assert person.cc == new_person.cc

    person = %Nontinuum.PersonMockImpl{
      cc: Util.generate_number_random(),
      name: "Kevin2",
      last_name: "Rodriguez2",
      email: "kevin2@rodrigyez.net",
      uuid: UUID.uuid1()
    }

    new_person = Nontinuum.MongoHandler.create(handler, person)
    assert person.cc == new_person.cc
  end
end
