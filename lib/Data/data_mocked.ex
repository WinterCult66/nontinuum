defmodule DataMocked do

def person() do
 persons = [%Person{cc: 1, last_name: "rodriguez", name: "Kevin"}, %Person{cc: 2, last_name: "rodriguez", name: "Kevin"}]

 for person <- persons do
  IO.inspect(person.cc)
end

end


end
