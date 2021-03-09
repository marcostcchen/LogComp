defmodule Fita do
  def inicializar(left, right) do
    %{ left: left, right: right }
  end

  def at(fita) do
    List.first(fita.right)
  end

  def ajustar(fita) do
    { value, novo_direita } = List.pop_at(fita.right, 0)
    novo_esquerda = List.insert_at(fita.left, length(fita.left), value)

    inicializar(novo_esquerda, novo_direita)
  end

  def conteudo(fita) do
    fita
  end

  def fim?(fita) do
    at(fita) == "$"
  end
end
