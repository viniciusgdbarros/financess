defmodule Financess.Financeiro.Despesa do
  use Ecto.Schema
  import Ecto.Changeset


  schema "despesas" do
    field :gasto, :string
    field :valor, :integer
    field :parcela, :integer
    field :valorfinal, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:gasto, :valor, :parcela])
    |> validate_required([:gasto, :valor, :parcela])
    |> calculate_valorfinal
  end


  defp calculate_valorfinal(changeset) do
    # Verifica se os campos valor e parcela estão presentes no changeset
    case {get_field(changeset, :valor), get_field(changeset, :parcela)} do
      {valor, parcela} when is_integer(valor) and is_integer(parcela) ->
        put_change(changeset, :valorfinal, valor * parcela)
      _ ->
        changeset
      end
end

end
