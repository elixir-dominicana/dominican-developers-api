defmodule DominicanDevelopersApi.Repo.Migrations.CreateDevelopers do
  use Ecto.Migration

  def change do
    create table(:developers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :initials, :string
      add :login, :string
      add :avatar, :string
      add :bio, :text
      add :website_url, :string
      add :linkedin_url, :string
      add :stackoverflow_url, :string
      add :twitter_url, :string
      add :github_url, :string
      add :is_active, :boolean

      timestamps()
    end
  end
end
