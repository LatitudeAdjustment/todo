defmodule Todo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :starts, :naive_datetime

    field :title, :string
    field :description, :string

    field :completed, :boolean

    timestamps([type: :utc_datetime_usec])
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:starts, :title, :description, :completed])
    |> validate_required([:starts, :title])
    |> unique_constraint([:starts, :title])
  end
end
