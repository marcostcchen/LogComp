defmodule Ep2Test do
  use ExUnit.Case
  doctest Ep2

  defmodule LeiDeFormacao do
    defstruct alfa: "a", beta: "abc"
  end

  test "procuraLeiDeAcordoComOSimboloInicial" do

    leisDeFormacoes = [
      %LeiDeFormacao{alfa: "S", beta: "aSBC"},
      %LeiDeFormacao{alfa: "CB", beta: "BC"},
      %LeiDeFormacao{alfa: "aB", beta: "ab"},
      %LeiDeFormacao{alfa: "bB", beta: "bb"},
      %LeiDeFormacao{alfa: "bC", beta: "bc"},
      %LeiDeFormacao{alfa: "S", beta: "aBC"},
      %LeiDeFormacao{alfa: "cC", beta: "CC"}
    ]

    simboloInicial = "S"

    assert Ep2.procuraLeiDeAcordoComOSimboloInicial(leisDeFormacoes, simboloInicial) ==  %LeiDeFormacao{alfa: "S", beta: "aSBC"}
  end

  test "verificaSeApenasTerminais" do
    beta = "aabbcc"
    terminais = "abc"

    assert Ep2.verificaSeApenasTerminais(beta, terminais) == true
  end
end
