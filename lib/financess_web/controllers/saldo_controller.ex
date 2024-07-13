
defmodule FinancessWeb.SaldoController do

  use FinancessWeb, :controller
  alias Financess.Financeiro
  alias Financess.Financeiro.Saldo

    def index(conn, _params) do
      receita_mensal = Financeiro.list_receitas()
      despesa_mensal = Financeiro.list_despesas()

      saldo_total = Financeiro.list_saldototal()

      render(conn, :index, receita_mensal: receita_mensal, despesa_mensal: despesa_mensal, saldototal: saldo_total)
    end

  def new(conn, _params) do
    changeset = Financeiro.change_saldo(%Saldo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"saldo" => saldo_params}) do
    case Financeiro.create_saldo(saldo_params) do
      {:ok, saldo} ->
        conn
        |> put_flash(:info, "Saldo created successfully.")
        |> redirect(to: ~p"/saldototal/#{saldo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    saldo = Financeiro.get_saldo!(id)
    render(conn, :show, saldo: saldo)
  end

  def edit(conn, %{"id" => id}) do
    saldo = Financeiro.get_saldo!(id)
    changeset = Financeiro.change_saldo(saldo)
    render(conn, :edit, saldo: saldo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "saldo" => saldo_params}) do
    saldo = Financeiro.get_saldo!(id)

    case Financeiro.update_saldo(saldo, saldo_params) do
      {:ok, saldo} ->
        conn
        |> put_flash(:info, "Saldo updated successfully.")
        |> redirect(to: ~p"/saldototal/#{saldo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, saldo: saldo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    saldo = Financeiro.get_saldo!(id)
    {:ok, _saldo} = Financeiro.delete_saldo(saldo)

    conn
    |> put_flash(:info, "Saldo deleted successfully.")
    |> redirect(to: ~p"/saldototal")
  end
end
