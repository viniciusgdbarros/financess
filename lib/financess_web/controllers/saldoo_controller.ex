defmodule FinancessWeb.SaldooController do
  use FinancessWeb, :controller

  alias Financess.Financeiro
  alias Financess.Financeiro.Saldoo

  def index(conn, _params) do
    receita_mensal = Financeiro.list_receitas()
    despesa_mensal = Financeiro.list_despesas()

    saldo_total = Financeiro.list_saldototal()

    render(conn, :index, receita_mensal: receita_mensal, despesa_mensal: despesa_mensal, saldoresultante: saldo_total)

  end

  def new(conn, _params) do
    changeset = Financeiro.change_saldoo(%Saldoo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"saldoo" => saldoo_params}) do
    case Financeiro.create_saldoo(saldoo_params) do
      {:ok, saldoo} ->
        conn
        |> put_flash(:info, "Saldoo created successfully.")
        |> redirect(to: ~p"/saldos/#{saldoo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    saldoo = Financeiro.get_saldoo!(id)
    render(conn, :show, saldoo: saldoo)
  end

  def edit(conn, %{"id" => id}) do
    saldoo = Financeiro.get_saldoo!(id)
    changeset = Financeiro.change_saldoo(saldoo)
    render(conn, :edit, saldoo: saldoo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "saldoo" => saldoo_params}) do
    saldoo = Financeiro.get_saldoo!(id)

    case Financeiro.update_saldoo(saldoo, saldoo_params) do
      {:ok, saldoo} ->
        conn
        |> put_flash(:info, "Saldoo updated successfully.")
        |> redirect(to: ~p"/saldos/#{saldoo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, saldoo: saldoo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    saldoo = Financeiro.get_saldoo!(id)
    {:ok, _saldoo} = Financeiro.delete_saldoo(saldoo)

    conn
    |> put_flash(:info, "Saldoo deleted successfully.")
    |> redirect(to: ~p"/saldos")
  end
end
