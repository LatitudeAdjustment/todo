defmodule Todo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :starts, :utc_datetime_usec, null: false

      add :title, :string, null: false
      add :description, :string

      add :completed, :boolean, default: false, null: false

      timestamps()
    end
    create index(:tasks, [:starts])
    create unique_index(:tasks, [:starts, :title])
  end
end
