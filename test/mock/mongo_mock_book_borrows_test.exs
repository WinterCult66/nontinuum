defmodule MongoMockBookBorroweddTest do
  use ExUnit.Case

  test "Validation list Books Borroweds" do

    handler_person = handler = MongoDBMockPerson.new()
    handler_book = MongoDBMockBook.new()
    handler_borrowed = MongoDBMockBookBorrowed.new()


    person_1 = %Nontinuum.PersonMockImpl{cc: Util.generate_number_random, name: "Kevin1", last_name: "Rodriguez1", email: "kevin@rodrigyez.net", uuid: UUID.uuid1()} |> Nontinuum.MongoHandler.create(handler_person)
    person_2 = %Nontinuum.PersonMockImpl{cc: Util.generate_number_random, name: "Kevin2", last_name: "Rodriguez2", email: "kevin@rodrigyez.net", uuid: UUID.uuid1()} |> Nontinuum.MongoHandler.create(handler_person)
    person_3 = %Nontinuum.PersonMockImpl{cc: Util.generate_number_random, name: "Kevin3", last_name: "Rodriguez3", email: "kevin@rodrigyez.net", uuid: UUID.uuid1()} |> Nontinuum.MongoHandler.create(handler_person)
    person_4 = %Nontinuum.PersonMockImpl{cc: Util.generate_number_random, name: "Kevin4", last_name: "Rodriguez4", email: "kevin@rodrigyez.net", uuid: UUID.uuid1()} |> Nontinuum.MongoHandler.create(handler_person)
    person_5 = %Nontinuum.PersonMockImpl{cc: Util.generate_number_random, name: "Kevin5", last_name: "Rodriguez5", email: "kevin@rodrigyez.net", uuid: UUID.uuid1()} |> Nontinuum.MongoHandler.create(handler_person)

    new_book = %Nontinuum.BookMockImpl{title: "Harry Potter", description: "Medieval Book" , numberOfTotalCopies: 4,   uuid: UUID.uuid1()} |> Nontinuum.MongoHandler.create(handler_book)



    book_borrow = %Nontinuum.BookBorrowedImpl{uuid: UUID.uuid1(), uuidBook: new_book.uuid, uuidPerson: person_1.uuid}
    new_book_borrow = Nontinuum.MongoHandler.create(book_borrow, handler_borrowed)


    assert book_borrow.uuid == new_book_borrow.uuid

  end
end
