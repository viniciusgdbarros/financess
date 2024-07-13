defmodule Financess.Financeiro.Saldo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "saldototal" do
    field :receita_mensal, :integer
    field :despesa_mensal, :integer
    field :saldo_mensal, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saldo, attrs) do
    saldo
    |> cast(attrs, [:receita_mensal, :despesa_mensal, :saldo_mensal])
    |> validate_required([:receita_mensal, :despesa_mensal, :saldo_mensal])
    |> calcular_saldo
  end



    def calcular_saldo(changeset) do
      # Verifica se os campos valor e parcela estão presentes no changeset
      case {get_field(changeset, :receita_mensal), get_field(changeset, :despesa_mensal)} do
        {receita_mensal, despesa_mensal} when is_integer(receita_mensal) and is_integer(despesa_mensal) ->
          put_change(changeset, :saldo_mensal, receita_mensal - despesa_mensal)
        _ ->
          changeset
      end
    end

  end
