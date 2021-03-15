defmodule PersonTest do
  use ExUnit.Case

  test "Create Person" do
    person =
      %Nontinuum.PersonImpl{cc: 123456789, name: "Kevin", last_name: "Rodriguez",email: "kevin@rodrigyez.net", uuid: UUID.uuid1()}
      |> Nontinuum.MongoHandler.create(nil)
    {:ok, %Mongo.InsertOneResult{acknowledged: acknowledged, inserted_id: inserted_id}} = person
    assert true
  end

  # test "list Persons" do
  #   persons = Nontinuum.PersonImpl.new() |> Nontinuum.MongoHandler.find_all()
  #   [%{id: id, cc: cc, last_name: last_name, name: name}] = persons
  #   IO.inspect(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  #   assert true
  # end
end
