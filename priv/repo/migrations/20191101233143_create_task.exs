defmodule Time1.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:task) do
      add :name, :string
      add :description, :string
      add :time_spent, :string
      add :approved, :boolean, default: false, null: false
      add :worker, references(:users, on_delete: :nothing)
      add :manager, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:task, [:worker])
    create index(:task, [:manager])
  end
end
