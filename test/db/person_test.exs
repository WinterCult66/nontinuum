defmodule PersonTest do
  use ExUnit.Case

  test "Creating a connection with Mongo" do
    db_handler = MongoDB.create()
    person = %{first_name: "John", last_name: "Smith"}
    # Nontinuum.HelperPerson.create_person(db_handler.conn, person)
    new_person = MongoHandler.create(db_handler, person)

    assert true
  end
end
