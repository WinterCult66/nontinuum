defmodule PersonTest do
  use ExUnit.Case

  test "Create Person" do
    person = %Nontinuum.PersonImpl{name: "Kevin", cc: 104714, last_name: "Rodriguez"} |>Nontinuum.MongoHandler.create()
    {:ok, %Mongo.InsertOneResult{acknowledged: acknowledged, inserted_id: inserted_id}} = person
    assert acknowledged
  end

  test "list Persons" do
    persons = Nontinuum.PersonImpl.new |>Nontinuum.MongoHandler.find_all()
    [ %{id: id, cc: cc, last_name: last_name, name: name}] = persons
    IO.inspect(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    assert true
  end



end
