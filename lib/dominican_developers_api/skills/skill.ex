defmodule DominicanDevelopersApi.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias DominicanDevelopersApi.Developers.Developer

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "skills" do
    field :name, :string

    many_to_many(:developers, Developer, join_through: "developers_skilss")

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
