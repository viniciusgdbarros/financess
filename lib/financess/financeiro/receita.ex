defmodule Financess.Financeiro.Receita do
  import Financess.Financeiro
  use Ecto.Schema
  import Ecto.Changeset


  schema "receitas" do
    field :total, :integer
    field :salario, :integer
    field :rendaextra, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:salario, :rendaextra])
    |> validate_required([:salario, :rendaextra])
    |> calculate_total
  end

  def pega_receita( %{"id" => id}) , do: Repo.get!(Receita, id)

  defp calculate_total(changeset) do
    # Verifica se os campos valor e parcela estão presentes no changeset
    case {get_field(changeset, :salario), get_field(changeset, :rendaextra)} do
      {salario, rendaextra} when is_integer(salario) and is_integer(rendaextra) ->
        put_change(changeset, :total, salario + rendaextra)
      _ ->
        changeset
      end
end
end
