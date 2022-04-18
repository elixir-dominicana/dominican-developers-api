defmodule :"Elixir.DominicanDevelopersApi.Repo.Migrations.Add-missing-fields" do
  use Ecto.Migration

  def change do
    alter table(:developers) do
      add :first_name, :string
      add :last_name, :string
    end
  end
end
