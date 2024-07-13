defmodule Financess.Repo.Migrations.CreateSaldototal do
  use Ecto.Migration

  def change do
    create table(:saldototal) do
      add :receita_mensal, :integer
      add :despesa_mensal, :integer
      add :saldo_mensal, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
