defmodule Ep2 do
  defmodule LeiDeFormacao do
    defstruct alfa: "a", beta: "abc"
  end

  defmodule Gramatica do
    defstruct naoTerminais: "AB",
              terminais: "SBC",
              leisDeFormacoes: [%LeiDeFormacao{alfa: "S", beta: "aBC"}],
              simboloInicio: "S"
  end

  def main do
    # Entrada vai ser a cadeia para teste e a gramatica
    # Gramatica = (naoTerminais, terminais, leisDeFormacoes, simboloInicio)

    cadeiaAVerificar = "abc"

    naoTerminais = "AB"
    terminais = "SBC"

    leisDeFormacoes = [
      %LeiDeFormacao{alfa: "S", beta: "aBC"},
      %LeiDeFormacao{alfa: "S", beta: "aSBC"},
      %LeiDeFormacao{alfa: "CB", beta: "BC"},
      %LeiDeFormacao{alfa: "aB", beta: "ab"},
      %LeiDeFormacao{alfa: "bB", beta: "bb"},
      %LeiDeFormacao{alfa: "bC", beta: "bc"},
      %LeiDeFormacao{alfa: "cC", beta: "CC"}
    ]

    simboloInicio = "S"

    gramatica = %Gramatica{
      naoTerminais: naoTerminais,
      terminais: terminais,
      leisDeFormacoes: leisDeFormacoes,
      simboloInicio: simboloInicio
    }

    # 1. Funcao que gera as derivacoes
    listaCadeiasDaGramatica =
      Enum.reject(geraDerivacoes(gramatica, String.length(cadeiaAVerificar)), &is_nil/1)

    listaCadeiasDaGramatica
    # 2. Comparar se a cadeia de verificacao bate com as cadeias geradas
    # cadeiaPertence = verificaCadeiaPertence(cadeiaAVerificar, listaCadeiasDaGramatica)
  end

  def geraDerivacoes(gramatica, tamanhoCadeia) do
    simboloInicio = gramatica.simboloInicio
    leisQueComecamComSimboloInicio = []

    Enum.map(gramatica.leisDeFormacoes, fn leiDeFormacao ->
      IO.inspect(leiDeFormacao)
      IO.inspect(simboloInicio)

      if leiDeFormacao.alfa == simboloInicio do
        leisQueComecamComSimboloInicio ++ leiDeFormacao
      end
    end)

    # if (cadeia inicial)
    # LeisQueComecam.add(item)
  end

  # def verificaCadeiaPertence (cadeiaAVerificar, listaCadeiasDaGramatica) do
  #   pertence = Enum.find(listaCadeiasDaGramatica, fn cadeiaDaGramatica ->
  #     cadeiaDaGramatica == cadeiaAVerificar
  #   end)
  # end
end
