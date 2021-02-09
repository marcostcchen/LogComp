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

    cadeiaAVerificar = "aabc"

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

    # 1. Procura leis com simbolos iniciais
    derivacoes =
      geraDerivacoes(leisDeFormacoes, simboloInicio, String.length(cadeiaAVerificar), [])

    # 2. Funcao que gera as derivacoes
    # listaDerivacoes = geraDerivacoes(gramatica,  String.length(cadeiaAVerificar), "S")

    # 3. Comparar se a cadeia de verificacao bate com as cadeias geradas
    # cadeiaPertence = verificaCadeiaPertence(cadeiaAVerificar, listaCadeiasDaGramatica)
  end

  # Recebe uma lista de leis e retorna o primeiro que tiver com simbolo inicial
  def procuraLeiDeAcordoComOSimboloInicial([head | tail], simboloInicial) do
    if(head.alfa == simboloInicial) do
      head
    else
      procuraLeiDeAcordoComOSimboloInicial(tail, simboloInicial)
    end
  end

  def procuraLeiDeAcordoComOSimboloInicial([], simboloInicial) do
  end

  def geraDerivacoes([head | tail], simboloInicial, tamanhoCadeia, derivacoes) do
    IO.inspect(String.length(head.beta))
    IO.inspect(tamanhoCadeia)

    if(String.length(head.beta) == tamanhoCadeia) do
      #condicao de parada
    end

    #only terminais
    if(1) do
      # sucesso adiciona em derivacoes
    end

    geraDerivacoes(tail, simboloInicial, tamanhoCadeia, derivacoes)
  end

  def geraDerivacoes([], simboloInicial, tamanhoCadeia, derivacoes) do
    #acabou, retorna a lista derivacoes
    derivacoes
  end
end
