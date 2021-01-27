defmodule EPTest do
  use ExUnit.Case
  doctest EP

  test "greets the world" do
    assert EP.hello() == :world
  end
end
