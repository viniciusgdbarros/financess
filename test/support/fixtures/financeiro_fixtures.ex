defmodule Financess.FinanceiroFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Financess.Financeiro` context.
  """

  @doc """
  Generate a despesa.
  """
  def despesa_fixture(attrs \\ %{}) do
    {:ok, despesa} =
      attrs
      |> Enum.into(%{
        gasto: "some gasto",
        parcela: 42,
        valor: 42,
        valorfinal: 42
      })
      |> Financess.Financeiro.create_despesa()

    despesa
  end

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        rendaextra: 42,
        salario: 42,
        total: 42
      })
      |> Financess.Financeiro.create_receita()

    receita
  end

  @doc """
  Generate a saldo.
  """
  def saldo_fixture(attrs \\ %{}) do
    {:ok, saldo} =
      attrs
      |> Enum.into(%{
        despesa_mensal: 42,
        receita_mensal: 42,
        saldo_mensal: 42
      })
      |> Financess.Financeiro.create_saldo()

    saldo
  end

  @doc """
  Generate a saldoo.
  """
  def saldoo_fixture(attrs \\ %{}) do
    {:ok, saldoo} =
      attrs
      |> Enum.into(%{
        saldoresultante: 42
      })
      |> Financess.Financeiro.create_saldoo()

    saldoo
  end
end
