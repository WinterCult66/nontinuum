defmodule MongoMockBookTest do
  use ExUnit.Case

  test "Validation list Books" do
    handler = MongoDBMockBook.new()

    book = %Nontinuum.BookMockImpl{
      title: "Harry Potter",
      description: "Medieval Book",
      numberOfTotalCopies: 4,
      uuid: UUID.uuid1()
    }

    new_book = Nontinuum.MongoHandler.create(handler, book)

    assert book.uuid == new_book.uuid
  end
end
