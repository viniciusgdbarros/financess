defmodule Financess.Financeiro.Saldoo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "saldos" do
    field :saldoresultante, :integer
    field :receita_domes, :id
    field :despesa_domes, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saldoo, attrs) do
    saldoo
    |> cast(attrs, [:receita_domes, :despesa_domes])
    |> validate_required([:receita_domes, :despesa_domes])
    |> calcular_saldo
  end

  defp calcular_saldo(changeset) do
    case {get_field(changeset, :receita_domes), get_field(changeset, :despesa_domes)} do
      {total, valor} when is_integer(total) and is_integer(valor) ->
        put_change(changeset, :saldoresultante, total + valor)
      _ ->
        changeset
      end
  end
end
