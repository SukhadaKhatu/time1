defmodule Time1.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "task" do
    field :approved, :boolean, default: false
    field :description, :string
    field :name, :string
    field :time_spent, :string
    belongs_to :worker, Time1.Tasks.Task
    belongs_to :manager, Time1.Taks.Task

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :time_spent, :approved])
    |> validate_required([:name, :description, :time_spent, :approved])
  end
end
