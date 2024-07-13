defmodule Financess.Financeiro do
  @moduledoc """
  The Financeiro context.
  """

  import Ecto.Query, warn: false
  alias Financess.Repo

  alias Financess.Financeiro.Despesa

  @doc """
  Returns the list of despesas.

  ## Examples

      iex> list_despesas()
      [%Despesa{}, ...]

  """
  def list_despesas do
    Repo.all(Despesa)
  end

  @doc """
  Gets a single despesa.

  Raises `Ecto.NoResultsError` if the Despesa does not exist.

  ## Examples

      iex> get_despesa!(123)
      %Despesa{}

      iex> get_despesa!(456)
      ** (Ecto.NoResultsError)

  """
  def get_despesa!(id), do: Repo.get!(Despesa, id)

  @doc """
  Creates a despesa.

  ## Examples

      iex> create_despesa(%{field: value})
      {:ok, %Despesa{}}

      iex> create_despesa(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_despesa(attrs \\ %{}) do
    %Despesa{}
    |> Despesa.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a despesa.

  ## Examples

      iex> update_despesa(despesa, %{field: new_value})
      {:ok, %Despesa{}}

      iex> update_despesa(despesa, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_despesa(%Despesa{} = despesa, attrs) do
    despesa
    |> Despesa.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a despesa.

  ## Examples

      iex> delete_despesa(despesa)
      {:ok, %Despesa{}}

      iex> delete_despesa(despesa)
      {:error, %Ecto.Changeset{}}

  """
  def delete_despesa(%Despesa{} = despesa) do
    Repo.delete(despesa)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking despesa changes.

  ## Examples

      iex> change_despesa(despesa)
      %Ecto.Changeset{data: %Despesa{}}

  """
  def change_despesa(%Despesa{} = despesa, attrs \\ %{}) do
    Despesa.changeset(despesa, attrs)
  end

  alias Financess.Financeiro.Receita

  @doc """
  Returns the list of receitas.

  ## Examples

      iex> list_receitas()
      [%Receita{}, ...]

  """
  def list_receitas do
    Repo.all(Receita)
  end

  @doc """
  Gets a single receita.

  Raises `Ecto.NoResultsError` if the Receita does not exist.

  ## Examples

      iex> get_receita!(123)
      %Receita{}

      iex> get_receita!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receita!(id), do: Repo.get!(Receita, id)

  @doc """
  Creates a receita.

  ## Examples

      iex> create_receita(%{field: value})
      {:ok, %Receita{}}

      iex> create_receita(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receita(attrs \\ %{}) do
    %Receita{}
    |> Receita.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receita.

  ## Examples

      iex> update_receita(receita, %{field: new_value})
      {:ok, %Receita{}}

      iex> update_receita(receita, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receita(%Receita{} = receita, attrs) do
    receita
    |> Receita.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a receita.

  ## Examples

      iex> delete_receita(receita)
      {:ok, %Receita{}}

      iex> delete_receita(receita)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receita(%Receita{} = receita) do
    Repo.delete(receita)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receita changes.

  ## Examples

      iex> change_receita(receita)
      %Ecto.Changeset{data: %Receita{}}

  """
  def change_receita(%Receita{} = receita, attrs \\ %{}) do
    Receita.changeset(receita, attrs)
  end

  alias Financess.Financeiro.Saldo

  @doc """
  Returns the list of saldototal.

  ## Examples

      iex> list_saldototal()
      [%Saldo{}, ...]

  """
  def list_saldototal do
    Repo.all(Saldo)
  end

  @doc """
  Gets a single saldo.

  Raises `Ecto.NoResultsError` if the Saldo does not exist.

  ## Examples

      iex> get_saldo!(123)
      %Saldo{}

      iex> get_saldo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saldo!(id), do: Repo.get!(Saldo, id)

  @doc """
  Creates a saldo.

  ## Examples

      iex> create_saldo(%{field: value})
      {:ok, %Saldo{}}

      iex> create_saldo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saldo(attrs \\ %{}) do
    %Saldo{}
    |> Saldo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saldo.

  ## Examples

      iex> update_saldo(saldo, %{field: new_value})
      {:ok, %Saldo{}}

      iex> update_saldo(saldo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saldo(%Saldo{} = saldo, attrs) do
    saldo
    |> Saldo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saldo.

  ## Examples

      iex> delete_saldo(saldo)
      {:ok, %Saldo{}}

      iex> delete_saldo(saldo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saldo(%Saldo{} = saldo) do
    Repo.delete(saldo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saldo changes.

  ## Examples

      iex> change_saldo(saldo)
      %Ecto.Changeset{data: %Saldo{}}

  """
  def change_saldo(%Saldo{} = saldo, attrs \\ %{}) do
    Saldo.changeset(saldo, attrs)
  end

  alias Financess.Financeiro.Saldoo

  @doc """
  Returns the list of saldos.

  ## Examples

      iex> list_saldos()
      [%Saldoo{}, ...]

  """
  def list_saldos do
    Repo.all(Saldoo)
  end

  @doc """
  Gets a single saldoo.

  Raises `Ecto.NoResultsError` if the Saldoo does not exist.

  ## Examples

      iex> get_saldoo!(123)
      %Saldoo{}

      iex> get_saldoo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saldoo!(id), do: Repo.get!(Saldoo, id)

  @doc """
  Creates a saldoo.

  ## Examples

      iex> create_saldoo(%{field: value})
      {:ok, %Saldoo{}}

      iex> create_saldoo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saldoo(attrs \\ %{}) do
    %Saldoo{}
    |> Saldoo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saldoo.

  ## Examples

      iex> update_saldoo(saldoo, %{field: new_value})
      {:ok, %Saldoo{}}

      iex> update_saldoo(saldoo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saldoo(%Saldoo{} = saldoo, attrs) do
    saldoo
    |> Saldoo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saldoo.

  ## Examples

      iex> delete_saldoo(saldoo)
      {:ok, %Saldoo{}}

      iex> delete_saldoo(saldoo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saldoo(%Saldoo{} = saldoo) do
    Repo.delete(saldoo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saldoo changes.

  ## Examples

      iex> change_saldoo(saldoo)
      %Ecto.Changeset{data: %Saldoo{}}

  """
  def change_saldoo(%Saldoo{} = saldoo, attrs \\ %{}) do
    Saldoo.changeset(saldoo, attrs)
  end
end
