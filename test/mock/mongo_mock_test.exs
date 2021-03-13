defmodule MongoTest do
  use ExUnit.Case

  test "Create Person" do

    #expected = %Person{cc: 1, name: "Kevin"}
    expected = DataMocked.person
    handler = MongoDBMock.new
    new_user = MongoProtocol.find_person(handler, %{name: "Kevin"})
    IO.inspect(expected)
    IO.inspect(new_user)
    IO.inspect(expected == new_user)

    assert true
  end

end
