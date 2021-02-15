defmodule Ep2Test do
  use ExUnit.Case
  doctest Ep2

  defmodule LeiDeFormacao do
    defstruct alfa: "a", beta: "abc"
  end

  test "procuraLeiDeAcordoComOAlfa" do

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

    assert Ep2.procuraLeiDeAcordoComOAlfa(leisDeFormacoes, simboloInicial) ==  %LeiDeFormacao{alfa: "S", beta: "aSBC"}
  end

  test "verificaSeApenasTerminais" do
    beta = ["a","a","b","b","c","c"]
    terminais = ["a","b","c"]

    assert Ep2.verificaSeApenasTerminais(beta, terminais) == true
  end

  test "verificaCadeiaPertenceDerivacoes" do
    listaDerivacoes = ["abc, ac, bc"]
    cadeiaAVerificar = "bc"

    assert Ep2.verificaCadeiaPertenceDerivacoes(listaDerivacoes, cadeiaAVerificar) == true
  end
end
