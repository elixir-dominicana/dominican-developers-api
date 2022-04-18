defmodule DominicanDevelopersApi.Developers.Developer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "developers" do
    field :first_name, :string
    field :last_name, :string
    field :avatar, :string
    field :bio, :string
    field :github_url, :string
    field :initials, :string
    field :linkedin_url, :string
    field :login, :string
    field :stackoverflow_url, :string
    field :twitter_url, :string
    field :website_url, :string
    field :is_active, :boolean

    timestamps()
  end

  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [
      :first_name,
      :last_name,
      :initials,
      :login,
      :avatar,
      :bio,
      :website_url,
      :linkedin_url,
      :stackoverflow_url,
      :twitter_url,
      :github_url,
      :is_active
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :initials,
      :login,
      :avatar,
      :bio,
      :website_url,
      :linkedin_url,
      :stackoverflow_url,
      :twitter_url,
      :github_url,
      :is_active
    ])
  end
end
