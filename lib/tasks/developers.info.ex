defmodule Mix.Tasks.Developers.Info do
  use Mix.Task
  alias Utils.CSVCreator, as: CSV

  @shortdoc "Get the developers info and insert to DB"

  @moduledoc """
  This module is a task to make a fetch and get all developers information from
  json repository, and insert that info to DB.
  """

  @requirements ["app.config"]

  @impl Mix.Task
  def run(_args) do
    get_data()
    |> Map.get(:body)
    |> Jason.decode!()
    |> Enum.filter(& &1["github"])
    |> Enum.map(&process_data/1)
    |> Enum.map(&CSV.parser_data/1)
    |> CSV.put_headers([
      "avatar",
      "bio",
      "first_name",
      "github_url",
      "initials",
      "website",
      "linkedin_url",
      "login",
      "last_name",
      "twitter_url",
      "stackoverflow_url"
    ])
    |> CSV.create_csv("./priv/repo/seeders/developers.csv")

    # |> IO.inspect()
  end

  defp get_data() do
    Application.ensure_all_started(:hackney)
    url = System.get_env("DEVELOPERS_JSON_DATA")

    HTTPoison.get!(url)
  end

  defp process_data(developer) do
    login =
      developer["github"]
      |> String.split("/")
      |> List.last()

    %{
      avatar: "",
      login: login,
      first_name: developer["name"],
      last_name: "",
      bio: developer["summary"],
      initials: developer["initials"],
      linkedin_url: developer["linkedin"],
      stackoverflow_url: developer["stackoverflow"],
      twitter_url: developer["twitter"],
      website_url: developer["webpage"],
      github_url: developer["github"]
    }
  end
end
