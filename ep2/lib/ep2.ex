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

    # 1. Procura leis com simbolos iniciais
    derivacoes =
      geraDerivacoes(leisDeFormacoes, simboloInicio, terminais, String.length(cadeiaAVerificar), [])

    # 2. Funcao que gera as derivacoes
    # listaDerivacoes = geraDerivacoes(gramatica,  String.length(cadeiaAVerificar), "S")

    # 3. Comparar se a cadeia de verificacao bate com as cadeias geradas
    # cadeiaPertence = verificaCadeiaPertence(cadeiaAVerificar, listaCadeiasDaGramatica)
  end

  def geraDerivacoes([head | tail], simboloInicial, terminais, tamanhoCadeia, derivacoes) do
    if(String.length(head.beta) == tamanhoCadeia) do
    end

    isApenasTerminais = verificaSeApenasTerminais(head.beta, terminais)
    if(isApenasTerminais) do
      geraDerivacoes(tail, simboloInicial, terminais, tamanhoCadeia, derivacoes ++ [head.beta])
    else
      geraDerivacoes(tail, simboloInicial, terminais, tamanhoCadeia, derivacoes)
    end
  end

  def geraDerivacoes([], simboloInicial, terminais, tamanhoCadeia, derivacoes) do  #acabou, retorna a lista derivacoes
    derivacoes
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

  #recebe o beta e verifica se sao apenas terminais
  def verificaSeApenasTerminais(beta, terminais) do
    letrasBeta = String.codepoints(beta)
    terminais = String.codepoints(terminais)

    verificaSeApenasTerminal(letrasBeta, terminais)
  end

  #!!Testar!!
  def verificaSeApenasTerminal([head | tail], terminais) do
    #if head pertence aos terminais, continua ate acabar, se acabar eh true
    pertence = Enum.find(terminais, fn terminal ->
      head == terminal
    end)

    if(pertence != nil) do
      verificaSeApenasTerminal(tail, terminais)
    else
      false
    end
  end

  def verificaSeApenasTerminal([], terminais) do
    true
  end

end
