defmodule Mix.Tasks.Developers.Info do
  use Mix.Task

  @shortdoc "Get the developers info and insert to DB"

  @moduledoc """
  This module is a task to make a fetch and get all developers information from
  json repository, and insert that info to DB.
  """

  @requirements ["app.config"]

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Fetching to get all developer data...")
  end
end
