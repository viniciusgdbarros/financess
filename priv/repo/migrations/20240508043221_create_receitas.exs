defmodule Financess.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :salario, :integer
      add :rendaextra, :integer
      add :total, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
