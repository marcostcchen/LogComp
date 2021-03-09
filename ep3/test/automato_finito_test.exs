defmodule AutomatoFinito do
  use ExUnit.Case
  doctest AutomatoFinito

  test "Criar automato teste" do
    transicoes = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    estadosAceitos = ["q1"]
    estadoInicial = "q0"
    assert AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos) ==
      %{
        transicoes: transicoes,
      estadoInicial: estadoInicial,
      estadosAceitos: estadosAceitos,
      current_state: estadoInicial
      }
  end

  test "Adiciona a fita no automato" do
    assert AutomatoFinito.pegar_fita(["h", "e"]) ==
      %{ esquerda: ["$"], direita: ["h", "e", "$"] }
  end

  test "Aplica as transicoes no automato" do
    transicoes = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    estadoInicial = "q0"
    estadosAceitos = ["q1"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    fita = AutomatoFinito.pegar_fita(["b"])

    assert AutomatoFinito.pegar_novos_estados(automato, fita) ==
      ["q1"]
  end

  test "Aplica as trnasicoes com um estado invalido" do
    transicoes = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    estadoInicial = "q0"
    estadosAceitos = ["q1"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    fita = AutomatoFinito.pegar_fita(["c"])

    assert AutomatoFinito.pegar_novos_estados(automato, fita) == []
  end

  test "Atualiza o automato" do
    transicoes = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    estadoInicial = "q0"
    estadosAceitos = ["q1"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    new_state = "q1"

    assert AutomatoFinito.atualizar_automato(automato, new_state).current_state == "q1"
  end

  test "Valida o estado do automato" do
    transicoes = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    estadoInicial = "q1"
    estadosAceitos = ["q1"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)

    assert AutomatoFinito.estado_aceito?(automato) == :true
  end

  test "Executa um automato deterministico válido" do
    transicoes = %{
      "q0" => [{"a", "q0"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q1"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    estadoInicial = "q0"
    estadosAceitos = ["q2"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    fita = AutomatoFinito.pegar_fita(["b", "a"])

    assert AutomatoFinito.executa_aceitacao(automato, fita) == :true
  end

  test "Executa um automato deterministico não válido" do
    transicoes = %{
      "q0" => [{"a", "q0"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q1"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    estadoInicial = "q0"
    estadosAceitos = ["q2"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    fita = AutomatoFinito.pegar_fita(["a", "b"])

    assert AutomatoFinito.executa_aceitacao(automato, fita) == :false
  end

  test "Executa um automato não deterministico válido" do
    transicoes = %{
      "q0" => [{"a", "q0"}, {"a", "q1"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q0"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    estadoInicial = "q0"
    estadosAceitos = ["q2"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    fita = AutomatoFinito.pegar_fita(["a", "a"])

    assert AutomatoFinito.executa_aceitacao(automato, fita) == :true
  end

  test "Executa um automato não deterministico não válido" do
    transicoes = %{
      "q0" => [{"a", "q0"}, {"a", "q1"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q0"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    estadoInicial = "q0"
    estadosAceitos = ["q2"]
    automato = AutomatoFinito.inicializar_automato(transicoes, estadoInicial, estadosAceitos)
    fita = AutomatoFinito.pegar_fita(["a", "b", "b"])

    assert AutomatoFinito.executa_aceitacao(automato, fita) == :false
  end
end
