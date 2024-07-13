defmodule Financess.Repo.Migrations.CreateSaldos do
  use Ecto.Migration

  def change do
    create table(:saldos) do
      add :saldoresultante, :integer
      add :receita_domes, references(:receitas, on_delete: :nothing)
      add :despesa_domes, references(:despesas, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:saldos, [:receita_domes])
    create index(:saldos, [:despesa_domes])
  end
end
