defmodule DominicanDevelopersApi.DevelopersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DominicanDevelopersApi.Developers` context.
  """

  @doc """
  Generate a developer.
  """
  def developer_fixture(attrs \\ %{}) do
    {:ok, developer} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        bio: "some bio",
        created_at: ~N[2022-04-17 14:50:00],
        deleted_at: ~N[2022-04-17 14:50:00],
        github_url: "some github_url",
        id: "7488a646-e31f-11e4-aace-600308960662",
        initials: "some initials",
        linkedin_url: "some linkedin_url",
        login: "some login",
        stackoverflow_url: "some stackoverflow_url",
        twitter_url: "some twitter_url",
        updated_at: ~N[2022-04-17 14:50:00],
        website_url: "some website_url"
      })
      |> DominicanDevelopersApi.Developers.create_developer()

    developer
  end
end
