defmodule Nontinuum.BookBorrowedImpl do
  defstruct [:uuid, :uuidBook, :uuidPerson, :numberOfTotalCopies]

  def new(), do: %Nontinuum.BookBorrowedImpl{}

  defimpl Nontinuum.MongoHandler, for: MongoDBMockBookBorrowed do
    def create(handler, data) do
      GenServer.call(handler.pid, {:create, data})
    end

    def delete(_, _), do: :uninplmented
    def find_all(_, _), do: :uninplmented
    def update(_, _), do: :uninplmented
  end
end
