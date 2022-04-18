defmodule DominicanDevelopersApi.Developers do
  @moduledoc """
  The Developers context.
  """

  import Ecto.Query, warn: false
  alias DominicanDevelopersApi.Repo

  alias DominicanDevelopersApi.Developers.Developer

  @doc """
  Returns the list of developers.

  ## Examples

      iex> list_developers()
      [%Developer{}, ...]

  """
  def list_developers do
    Repo.all(Developer)
  end

  @doc """
  Gets a single developer.

  Raises `Ecto.NoResultsError` if the Developer does not exist.

  ## Examples

      iex> get_developer!(123)
      %Developer{}

      iex> get_developer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_developer!(id), do: Repo.get!(Developer, id)

  @doc """
  Creates a developer.

  ## Examples

      iex> create_developer(%{field: value})
      {:ok, %Developer{}}

      iex> create_developer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_developer(attrs \\ %{}) do
    %Developer{}
    |> Developer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a developer.

  ## Examples

      iex> update_developer(developer, %{field: new_value})
      {:ok, %Developer{}}

      iex> update_developer(developer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_developer(%Developer{} = developer, attrs) do
    developer
    |> Developer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a developer.

  ## Examples

      iex> delete_developer(developer)
      {:ok, %Developer{}}

      iex> delete_developer(developer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_developer(%Developer{} = developer) do
    Repo.delete(developer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking developer changes.

  ## Examples

      iex> change_developer(developer)
      %Ecto.Changeset{data: %Developer{}}

  """
  def change_developer(%Developer{} = developer, attrs \\ %{}) do
    Developer.changeset(developer, attrs)
  end
end
