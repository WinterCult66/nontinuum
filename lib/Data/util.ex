defmodule Util do

  def generate_number_random (n \\999999999) do
    :rand.uniform(n)
  end
end
