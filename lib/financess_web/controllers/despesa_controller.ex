defmodule FinancessWeb.DespesaController do

  use FinancessWeb, :controller

  alias Financess.Financeiro
  alias Financess.Financeiro.Despesa

  def index(conn, _params) do
    despesas = Financeiro.list_despesas()
    # Calculando o valor total das despesas
    total_valorfinal = Enum.reduce(despesas, 0, fn despesa, acc -> acc + despesa.valor end)
    render(conn, :index, despesas: despesas, total_valorfinal: total_valorfinal)
  end

  def new(conn, _params) do
    changeset = Financeiro.change_despesa(%Despesa{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"despesa" => despesa_params}) do
    case Financeiro.create_despesa(despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa created successfully.")
        |> redirect(to: ~p"/despesas/#{despesa}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesa = Financeiro.get_despesa!(id)
    render(conn, :show, despesa: despesa)
  end

  def edit(conn, %{"id" => id}) do
    despesa = Financeiro.get_despesa!(id)
    changeset = Financeiro.change_despesa(despesa)
    render(conn, :edit, despesa: despesa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesa" => despesa_params}) do
    despesa = Financeiro.get_despesa!(id)

    case Financeiro.update_despesa(despesa, despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa updated successfully.")
        |> redirect(to: ~p"/despesas/#{despesa}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, despesa: despesa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesa = Financeiro.get_despesa!(id)
    {:ok, _despesa} = Financeiro.delete_despesa(despesa)

    conn
    |> put_flash(:info, "Despesa deleted successfully.")
    |> redirect(to: ~p"/despesas")
  end
end
