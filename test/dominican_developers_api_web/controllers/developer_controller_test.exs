defmodule DominicanDevelopersApiWeb.DeveloperControllerTest do
  use DominicanDevelopersApiWeb.ConnCase

  import DominicanDevelopersApi.DevelopersFixtures

  alias DominicanDevelopersApi.Developers.Developer

  @create_attrs %{
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
  }
  @update_attrs %{
    avatar: "some updated avatar",
    bio: "some updated bio",
    created_at: ~N[2022-04-18 14:50:00],
    deleted_at: ~N[2022-04-18 14:50:00],
    github_url: "some updated github_url",
    id: "7488a646-e31f-11e4-aace-600308960668",
    initials: "some updated initials",
    linkedin_url: "some updated linkedin_url",
    login: "some updated login",
    stackoverflow_url: "some updated stackoverflow_url",
    twitter_url: "some updated twitter_url",
    updated_at: ~N[2022-04-18 14:50:00],
    website_url: "some updated website_url"
  }
  @invalid_attrs %{
    avatar: nil,
    bio: nil,
    created_at: nil,
    deleted_at: nil,
    github_url: nil,
    id: nil,
    initials: nil,
    linkedin_url: nil,
    login: nil,
    stackoverflow_url: nil,
    twitter_url: nil,
    updated_at: nil,
    website_url: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all developers", %{conn: conn} do
      conn = get(conn, Routes.developer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create developer" do
    test "renders developer when data is valid", %{conn: conn} do
      conn = post(conn, Routes.developer_path(conn, :create), developer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.developer_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "avatar" => "some avatar",
               "bio" => "some bio",
               "created_at" => "2022-04-17T14:50:00",
               "deleted_at" => "2022-04-17T14:50:00",
               "github_url" => "some github_url",
               "id" => "7488a646-e31f-11e4-aace-600308960662",
               "initials" => "some initials",
               "linkedin_url" => "some linkedin_url",
               "login" => "some login",
               "stackoverflow_url" => "some stackoverflow_url",
               "twitter_url" => "some twitter_url",
               "updated_at" => "2022-04-17T14:50:00",
               "website_url" => "some website_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.developer_path(conn, :create), developer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update developer" do
    setup [:create_developer]

    test "renders developer when data is valid", %{
      conn: conn,
      developer: %Developer{id: id} = developer
    } do
      conn = put(conn, Routes.developer_path(conn, :update, developer), developer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.developer_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "avatar" => "some updated avatar",
               "bio" => "some updated bio",
               "created_at" => "2022-04-18T14:50:00",
               "deleted_at" => "2022-04-18T14:50:00",
               "github_url" => "some updated github_url",
               "id" => "7488a646-e31f-11e4-aace-600308960668",
               "initials" => "some updated initials",
               "linkedin_url" => "some updated linkedin_url",
               "login" => "some updated login",
               "stackoverflow_url" => "some updated stackoverflow_url",
               "twitter_url" => "some updated twitter_url",
               "updated_at" => "2022-04-18T14:50:00",
               "website_url" => "some updated website_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, developer: developer} do
      conn = put(conn, Routes.developer_path(conn, :update, developer), developer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete developer" do
    setup [:create_developer]

    test "deletes chosen developer", %{conn: conn, developer: developer} do
      conn = delete(conn, Routes.developer_path(conn, :delete, developer))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.developer_path(conn, :show, developer))
      end
    end
  end

  defp create_developer(_) do
    developer = developer_fixture()
    %{developer: developer}
  end
end
