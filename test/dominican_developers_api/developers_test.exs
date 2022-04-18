defmodule DominicanDevelopersApi.DevelopersTest do
  use DominicanDevelopersApi.DataCase

  alias DominicanDevelopersApi.Developers

  describe "developers" do
    alias DominicanDevelopersApi.Developers.Developer

    import DominicanDevelopersApi.DevelopersFixtures

    @invalid_attrs %{avatar: nil, bio: nil, created_at: nil, deleted_at: nil, github_url: nil, id: nil, initials: nil, linkedin_url: nil, login: nil, stackoverflow_url: nil, twitter_url: nil, updated_at: nil, website_url: nil}

    test "list_developers/0 returns all developers" do
      developer = developer_fixture()
      assert Developers.list_developers() == [developer]
    end

    test "get_developer!/1 returns the developer with given id" do
      developer = developer_fixture()
      assert Developers.get_developer!(developer.id) == developer
    end

    test "create_developer/1 with valid data creates a developer" do
      valid_attrs = %{avatar: "some avatar", bio: "some bio", created_at: ~N[2022-04-17 14:50:00], deleted_at: ~N[2022-04-17 14:50:00], github_url: "some github_url", id: "7488a646-e31f-11e4-aace-600308960662", initials: "some initials", linkedin_url: "some linkedin_url", login: "some login", stackoverflow_url: "some stackoverflow_url", twitter_url: "some twitter_url", updated_at: ~N[2022-04-17 14:50:00], website_url: "some website_url"}

      assert {:ok, %Developer{} = developer} = Developers.create_developer(valid_attrs)
      assert developer.avatar == "some avatar"
      assert developer.bio == "some bio"
      assert developer.created_at == ~N[2022-04-17 14:50:00]
      assert developer.deleted_at == ~N[2022-04-17 14:50:00]
      assert developer.github_url == "some github_url"
      assert developer.id == "7488a646-e31f-11e4-aace-600308960662"
      assert developer.initials == "some initials"
      assert developer.linkedin_url == "some linkedin_url"
      assert developer.login == "some login"
      assert developer.stackoverflow_url == "some stackoverflow_url"
      assert developer.twitter_url == "some twitter_url"
      assert developer.updated_at == ~N[2022-04-17 14:50:00]
      assert developer.website_url == "some website_url"
    end

    test "create_developer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Developers.create_developer(@invalid_attrs)
    end

    test "update_developer/2 with valid data updates the developer" do
      developer = developer_fixture()
      update_attrs = %{avatar: "some updated avatar", bio: "some updated bio", created_at: ~N[2022-04-18 14:50:00], deleted_at: ~N[2022-04-18 14:50:00], github_url: "some updated github_url", id: "7488a646-e31f-11e4-aace-600308960668", initials: "some updated initials", linkedin_url: "some updated linkedin_url", login: "some updated login", stackoverflow_url: "some updated stackoverflow_url", twitter_url: "some updated twitter_url", updated_at: ~N[2022-04-18 14:50:00], website_url: "some updated website_url"}

      assert {:ok, %Developer{} = developer} = Developers.update_developer(developer, update_attrs)
      assert developer.avatar == "some updated avatar"
      assert developer.bio == "some updated bio"
      assert developer.created_at == ~N[2022-04-18 14:50:00]
      assert developer.deleted_at == ~N[2022-04-18 14:50:00]
      assert developer.github_url == "some updated github_url"
      assert developer.id == "7488a646-e31f-11e4-aace-600308960668"
      assert developer.initials == "some updated initials"
      assert developer.linkedin_url == "some updated linkedin_url"
      assert developer.login == "some updated login"
      assert developer.stackoverflow_url == "some updated stackoverflow_url"
      assert developer.twitter_url == "some updated twitter_url"
      assert developer.updated_at == ~N[2022-04-18 14:50:00]
      assert developer.website_url == "some updated website_url"
    end

    test "update_developer/2 with invalid data returns error changeset" do
      developer = developer_fixture()
      assert {:error, %Ecto.Changeset{}} = Developers.update_developer(developer, @invalid_attrs)
      assert developer == Developers.get_developer!(developer.id)
    end

    test "delete_developer/1 deletes the developer" do
      developer = developer_fixture()
      assert {:ok, %Developer{}} = Developers.delete_developer(developer)
      assert_raise Ecto.NoResultsError, fn -> Developers.get_developer!(developer.id) end
    end

    test "change_developer/1 returns a developer changeset" do
      developer = developer_fixture()
      assert %Ecto.Changeset{} = Developers.change_developer(developer)
    end
  end
end
