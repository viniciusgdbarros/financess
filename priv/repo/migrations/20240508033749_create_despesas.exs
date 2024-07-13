defmodule Financess.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :gasto, :string
      add :valor, :integer
      add :parcela, :integer
      add :valorfinal, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
