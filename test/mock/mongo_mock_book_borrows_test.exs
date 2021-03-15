defmodule MongoMockBookBorroweddTest do
  use ExUnit.Case

  test "Validation list Books Borroweds" do
    handler = MongoDBMockBookBorrowed.new()


    

    book_borrow = %Nontinuum.BookBorrowedImpl{uuid: "kevin", uuidBook: "rodriguez", uuidPerson: "rr"}
    new_book_borrow = Nontinuum.MongoHandler.create(book_borrow, handler)


    assert book_borrow.uuid == new_book_borrow.uuid

  end
end
