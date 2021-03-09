defmodule FitaTest do
  use ExUnit.Case
  doctest Fita

  test "Criar nova fita" do
    assert Fita.inicializar(["$", "h", "e"], ["l", "l", "o", "$"]) ==
      %{
        left: ["$", "h", "e"],
        right: ["l", "l", "o", "$"]
      }
  end

  test "Pega o caractere" do
    fita = Fita.inicializar(["$", "h"], ["o", "$"])
    assert Fita.at(fita) == "o"
  end

  test "Move o primeiro item para direita" do
    fita = Fita.inicializar(["$", "h"], ["l", "o", "$"])
    assert Fita.ajustar(fita) == 
      %{
        left: ["$", "h", "l"],
        right: ["o", "$"]
      }
  end

  test "Retorna o conteudo da fita" do
    fita = Fita.inicializar(["$", "h"], ["l", "o", "$"])

    assert Fita.conteudo(fita) == fita
  end
end
