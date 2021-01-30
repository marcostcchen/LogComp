defmodule EP do
  def main do
    conjuntoA = [1, 2, 3]
    conjuntoAxA = create_conjunto_AxA(conjuntoA)
    conjuntoReflexivo = Enum.reject(get_conjunto_reflexivo(conjuntoAxA), &is_nil/1)

    IO.puts("Conjunto Reflexivo: ")
    IO.inspect(conjuntoReflexivo)
  end

  # Cria o conjunto AxA
  def create_conjunto_AxA(conjuntoA) do
    conjuntoAxA = []

    for objeto1 <- conjuntoA, objeto2 <- conjuntoA do
      conjuntoAxA ++ [objeto1, objeto2]
    end
  end

  # Recebe o conjunto AxA e retorna o seu conjunto reflexivo
  def get_conjunto_reflexivo(conjuntoAxA) do
    conjuntoReflexivo = []

    Enum.map(conjuntoAxA, fn relacaoBinaria ->
      primeiroElemento = List.first(relacaoBinaria)

      isReflexivo =
        Enum.find(relacaoBinaria, fn elemento ->
          elemento != primeiroElemento
        end)

      if isReflexivo == nil do
         conjuntoReflexivo ++ relacaoBinaria
      end
      
    end)
  end
end
