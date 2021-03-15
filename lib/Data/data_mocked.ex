defmodule DataMocked do


  # def person() do
  #   persons = [
  #     %Person{cc: 1, last_name: "rodriguez", name: "Kevin"},
  #     %Person{cc: 2, last_name: "rodriguez", name: "Kevin"}
  #   ]

  #   for person <- persons do
  #     IO.inspect(person.cc)
  #   end
  # end



  def construct_person(type, name, last_name, email) do
     person =  cond do
        type == :person_impl  ->  %Nontinuum.PersonImpl{cc: Util.generate_number_random,name: name,last_name: last_name, email: email,uuid: UUID.uuid1()}
        type == nil -> [cc: 444, name: name, last_name: last_name, email: email, uuid: UUID.uuid1()]
      end
      IO.inspect(person)

  end
end
