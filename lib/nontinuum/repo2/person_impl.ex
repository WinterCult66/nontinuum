defmodule Nontinuum.PersonImpl do
  defstruct [:name, :cc, :last_name]

  defimpl Nontinuum.MongoHandler, for: __MODULE__ do
    def create( data) do
      Nontinuum.HelperPerson.create_person(nil, data)
    end
  end

end
