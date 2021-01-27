defmodule EP do
  def main do
    conjuntoA = [1, 2, 3]
    conjuntoAxA = create_conjunto_AxA(conjuntoA)
    conjuntoReflexivo = get_conjunto_reflexivo(conjuntoAxA)
  end

  def create_conjunto_AxA(conjuntoA) do
    conjuntoAxA = []

    for objeto1 <- conjuntoA, objeto2 <- conjuntoA do
      conjuntoAxA ++ [objeto1, objeto2]
    end
  end

  def get_conjunto_reflexivo(conjuntoAxA) do
    conjuntoReflexivo = []

    Enum.map(conjuntoAxA, fn relacaoBinaria ->
      # verifico se todos elementos sao igual ao primeiro
      primeiroElemento = List.first(relacaoBinaria)

      # se is reflexivo for um numero, significa que nao eh reflexivo
      isReflexivo =
        Enum.find(relacaoBinaria, fn elemento ->
          elemento != primeiroElemento
        end)

      if isReflexivo != nil do
         conjuntoReflexivo ++ relacaoBinaria
      end
    end)
  end
end
