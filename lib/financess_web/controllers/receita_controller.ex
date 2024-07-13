defmodule FinancessWeb.ReceitaController do
  use FinancessWeb, :controller

  alias Financess.Financeiro
  alias Financess.Financeiro.Receita

  def index(conn, _params) do
    receitas = Financeiro.list_receitas()
    total_valorreceita = Enum.reduce(receitas, 0, fn receita, acc -> acc + receita.total end)
    render(conn, :index, receitas: receitas, total_valorreceita: total_valorreceita)
  end

  def new(conn, _params) do
    changeset = Financeiro.change_receita(%Receita{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"receita" => receita_params}) do
    case Financeiro.create_receita(receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita created successfully.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receita = Financeiro.get_receita!(id)
    render(conn, :show, receita: receita)
  end

  def edit(conn, %{"id" => id}) do
    receita = Financeiro.get_receita!(id)
    changeset = Financeiro.change_receita(receita)
    render(conn, :edit, receita: receita, changeset: changeset)
  end

  def update(conn, %{"id" => id, "receita" => receita_params}) do
    receita = Financeiro.get_receita!(id)

    case Financeiro.update_receita(receita, receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita updated successfully.")
        |> redirect(to: ~p"/receitas/#{receita}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Financeiro.get_receita!(id)
    {:ok, _receita} = Financeiro.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deleted successfully.")
    |> redirect(to: ~p"/receitas")
  end
end
