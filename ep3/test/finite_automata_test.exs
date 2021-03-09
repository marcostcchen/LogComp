defmodule AutomatoFinito do
  use ExUnit.Case
  doctest AutomatoFinito

  test "Criar automato teste" do
    transitions = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    accept_states = ["q1"]
    initial_state = "q0"
    assert AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states) ==
      %{
        transitions: transitions,
        initial_state: initial_state,
        accept_states: accept_states,
        current_state: initial_state
      }
  end

  test "should add the tape to automata with input" do
    assert AutomatoFinito.pegar_fita(["h", "e"]) ==
      %{ left: ["$"], right: ["h", "e", "$"] }
  end

  test "should apply transitions to automata" do
    transitions = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    initial_state = "q0"
    accept_states = ["q1"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    tape = AutomatoFinito.pegar_fita(["b"])

    assert AutomatoFinito.pegar_novos_estados(automata, tape) ==
      ["q1"]
  end

  test "should apply transitions with a invalid state" do
    transitions = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    initial_state = "q0"
    accept_states = ["q1"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    tape = AutomatoFinito.pegar_fita(["c"])

    assert AutomatoFinito.pegar_novos_estados(automata, tape) == []
  end

  test "update automata" do
    transitions = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    initial_state = "q0"
    accept_states = ["q1"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    new_state = "q1"

    assert AutomatoFinito.atualizar_automato(automata, new_state).current_state == "q1"
  end

  test "should validate accept state" do
    transitions = %{ "q0" => [{"a", "q0"}, {"b", "q1"}] }
    initial_state = "q1"
    accept_states = ["q1"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)

    assert AutomatoFinito.estado_aceito?(automata) == :true
  end

  test "should run acceptor valid input" do
    transitions = %{
      "q0" => [{"a", "q0"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q1"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    initial_state = "q0"
    accept_states = ["q2"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    tape = AutomatoFinito.pegar_fita(["b", "a"])

    assert AutomatoFinito.executa_aceitacao(automata, tape) == :true
  end

  test "should run acceptor invalid input" do
    transitions = %{
      "q0" => [{"a", "q0"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q1"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    initial_state = "q0"
    accept_states = ["q2"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    tape = AutomatoFinito.pegar_fita(["a", "b"])

    assert AutomatoFinito.executa_aceitacao(automata, tape) == :false
  end

  test "should run acceptor valid input non-deterministic" do
    transitions = %{
      "q0" => [{"a", "q0"}, {"a", "q1"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q0"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    initial_state = "q0"
    accept_states = ["q2"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    tape = AutomatoFinito.pegar_fita(["a", "a"])

    assert AutomatoFinito.executa_aceitacao(automata, tape) == :true
  end

  test "should run acceptor invalid input non-deterministic" do
    transitions = %{
      "q0" => [{"a", "q0"}, {"a", "q1"}, {"b", "q1"}],
      "q1" => [{"a", "q2"}, {"b", "q0"}],
      "q2" => [{"a", "q2"}, {"b", "q2"}]
    }
    initial_state = "q0"
    accept_states = ["q2"]
    automata = AutomatoFinito.inicializar_automato(transitions, initial_state, accept_states)
    tape = AutomatoFinito.pegar_fita(["a", "b", "b"])

    assert AutomatoFinito.executa_aceitacao(automata, tape) == :false
  end
end
