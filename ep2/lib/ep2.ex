defmodule Ep2 do
  defmodule LeiDeFormacao do
    defstruct alfa: "a", beta: "abc"
  end

  def verificaSeCadeiaPertenceAGramatica do
    # Entrada vai ser a cadeia para teste e a gramatica
    # Gramatica = (naoTerminais, terminais, leisDeFormacoes, simboloInicio)

    cadeiaAVerificar = "abc"

    naoTerminais = "AB"
    terminais = "abc"
    leisDeFormacoes = [
      %LeiDeFormacao{alfa: "A", beta: "abc"},
      %LeiDeFormacao{alfa: "B", beta: "bcd"}
    ]
    simboloInicio = "A"

    # 1. Funcao que gera as derivacoes
    listaCadeiasDaGramatica = geraDerivacoes(derivacoes)
  
    # 2. Comparar se a cadeia de verificacao bate com as cadeias geradas
    #cadeiaPertence = listaCadeiasDaGramatica.map(cadeia => {
    #  return cadeia == cadeiaAVerificar
    #})
    #return !!!cadeiaPertence

  end

  def geraDerivacoes (derivacoes) do
      
  end

end
