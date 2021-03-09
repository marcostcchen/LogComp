defmodule AutomatoFinito do
  def inicializar_automato(transicoes, estadoInicial, estadosAceitos) do
    %{
      transicoes: transicoes,
      estadoInicial: estadoInicial,
      estadosAceitos: estadosAceitos,
      current_state: estadoInicial
    }
  end

  def pegar_fita(input) do
    esquerda = ["$"]
    direita = List.insert_at(input, length(input), "$")
    Fita.inicializar(esquerda, direita)
  end

  def pegar_novos_estados(automata, fita) do
    current_input = Fita.at(fita)
    automata.transicoes
      |> Map.get(automata.current_state)
      |> Enum.filter(fn {elem, _state} -> elem == current_input end)
      |> Enum.map(fn {_elem, state} -> state end)
  end

  def atualizar_automato(automata, novo_estado) do
    automata
      |> Map.put(:current_state, novo_estado)
  end

  def estado_aceito?(automata) do
    Enum.member?(automata.estadosAceitos, automata.current_state)
  end

  def executa_aceitacao(automata, Fita) do
    if Fita.end?(Fita) do
      accept_state?(automata)
    else
      new_states = pegar_novos_estados(automata, Fita)
      new_Fita = Fita.reconfig(Fita)
      new_states
        |> Enum.any?(fn novo_estado ->
          new_automata = atualizar_automato(automata, novo_estado)
          executa_aceitacao(new_automata, new_Fita)
        end)
    end
  end
end
