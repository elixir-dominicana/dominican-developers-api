defmodule DominicanDevelopersApiWeb.DeveloperController do
  use DominicanDevelopersApiWeb, :controller

  alias DominicanDevelopersApi.Developers
  alias DominicanDevelopersApi.Developers.Developer

  action_fallback DominicanDevelopersApiWeb.FallbackController

  def index(conn, _params) do
    developers = Developers.list_developers()
    render(conn, "index.json", developers: developers)
  end

  def create(conn, %{"developer" => developer_params}) do
    with {:ok, %Developer{} = developer} <- Developers.create_developer(developer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.developer_path(conn, :show, developer))
      |> render("show.json", developer: developer)
    end
  end

  def show(conn, %{"id" => id}) do
    developer = Developers.get_developer!(id)
    render(conn, "show.json", developer: developer)
  end

  def update(conn, %{"id" => id, "developer" => developer_params}) do
    developer = Developers.get_developer!(id)

    with {:ok, %Developer{} = developer} <-
           Developers.update_developer(developer, developer_params) do
      render(conn, "show.json", developer: developer)
    end
  end

  def delete(conn, %{"id" => id}) do
    developer = Developers.get_developer!(id)

    with {:ok, %Developer{}} <- Developers.delete_developer(developer) do
      send_resp(conn, :no_content, "")
    end
  end
end
