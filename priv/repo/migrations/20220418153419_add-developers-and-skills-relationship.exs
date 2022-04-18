defmodule :"Elixir.DominicanDevelopersApi.Repo.Migrations.Add-developers-and-skills-relationship" do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:developers_skills) do
      add :developer_id, references(:developers, on_delete: :nothing, type: :binary_id)
      add :skill_id, references(:skills, on_delete: :nothing, type: :binary_id)
    end
  end
end
