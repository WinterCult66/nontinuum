defmodule PersonTest do
  use ExUnit.Case

  test "Create Person" do
    person =
      %Nontinuum.PersonImpl{name: "Kevin", cc: 104_714, last_name: "Rodriguez"}

      Nontinuum.MongoHandler.create(person, nil)
      IO.inspect(person)
    #{:ok, %Mongo.InsertOneResult{acknowledged: acknowledged, inserted_id: inserted_id}} = person
    assert true
  end

  # test "list Persons" do
  #   persons = Nontinuum.PersonImpl.new() |> Nontinuum.MongoHandler.find_all()
  #   [%{id: id, cc: cc, last_name: last_name, name: name}] = persons
  #   IO.inspect(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  #   assert true
  # end
end
