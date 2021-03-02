defmodule Ep2 do
  defmodule LeiDeFormacao do
    defstruct alfa: "a", beta: "abc"
  end

  defmodule Gramatica do
    defstruct naoTerminais: "SBC",
              terminais: "abc",
              leisDeFormacoes: [%LeiDeFormacao{alfa: "S", beta: "aBC"}],
              simboloInicio: "S"
  end

  def main do
    # Entrada vai ser a cadeia para teste e a gramatica
    # Gramatica = (naoTerminais, terminais, leisDeFormacoes, simboloInicio)

    cadeiaAVerificar = "aabbcc"

    naoTerminais = "SBC"
    terminais = "abc"

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
    listaDerivacoes =
      geraDerivacoes(
        gramatica.leisDeFormacoes,
        gramatica.simboloInicio,
        gramatica.terminais,
        String.length(cadeiaAVerificar),
        []
      )

    # 2. Comparar se a cadeia de verificacao bate com as cadeias geradas
    cadeiaPertence = verificaCadeiaPertenceDerivacoes(listaDerivacoes, cadeiaAVerificar)
  end

  # head eh uma lei de formacao
  def geraDerivacoes([head | tail], simboloInicial, terminais, tamanhoCadeia, derivacoes) do
    if(String.length(head.beta) == tamanhoCadeia) do
    end

    listLetrasBeta = String.codepoints(head.beta)
    listLetrasTerminais = String.codepoints(terminais)

    #Verifico se o beta em analise apresenta apenas terminais
    isApenasTerminais = verificaSeApenasTerminais(listLetrasBeta, listLetrasTerminais)

    if(isApenasTerminais) do
      geraDerivacoes(tail, simboloInicial, terminais, tamanhoCadeia, derivacoes ++ [head.beta])
    else
      geraDerivacoes(tail, simboloInicial, terminais, tamanhoCadeia, derivacoes)
    end
  end

  # acabou, retorna a lista derivacoes
  def geraDerivacoes([], simboloInicial, terminais, tamanhoCadeia, derivacoes) do
    derivacoes
  end

  def verificaSeApenasTerminais([head | tail], listLetrasTerminais) do
    # if head pertence aos terminais, continua ate acabar, se acabar eh true
    pertence =
      Enum.find(listLetrasTerminais, fn terminal ->
        head == terminal
      end)

    if(pertence != nil) do
      verificaSeApenasTerminais(tail, listLetrasTerminais)
    else
      false
    end
  end

  def verificaSeApenasTerminais([], listLetrasTerminais) do
    true
  end

  # Recebe uma lista de leis e retorna o primeiro que tiver com simbolo inicial
  def procuraLeiDeAcordoComOAlfa([head | tail], alfa) do
    if(head.alfa == alfa) do
      head
    else
      procuraLeiDeAcordoComOAlfa(tail, alfa)
    end
  end

  def procuraLeiDeAcordoComOAlfa([], alfa) do
  end

  def verificaCadeiaPertenceDerivacoes([head | tail], cadeiaAVerificar) do
    if(head == cadeiaAVerificar) do
      true
    else
      verificaCadeiaPertenceDerivacoes(tail, cadeiaAVerificar)
    end
  end

  def verificaCadeiaPertenceDerivacoes([], cadeiaAVerificar) do
    false
  end
end
