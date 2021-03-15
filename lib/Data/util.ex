defmodule Util do
  def generate_number_random(n \\ 999_999_999) do
    :rand.uniform(n)
  end
end
