defmodule DominicanDevelopersApiWeb.DeveloperView do
  use DominicanDevelopersApiWeb, :view
  alias DominicanDevelopersApiWeb.DeveloperView

  def render("index.json", %{developers: developers}) do
    %{data: render_many(developers, DeveloperView, "developer.json")}
  end

  def render("show.json", %{developer: developer}) do
    %{data: render_one(developer, DeveloperView, "developer.json")}
  end

  def render("developer.json", %{developer: developer}) do
    %{
      id: developer.id,
      first_name: developer.first_name,
      last_name: developer.last_name,
      initials: developer.initials,
      login: developer.login,
      avatar: developer.avatar,
      bio: developer.bio,
      website_url: developer.website_url,
      linkedin_url: developer.linkedin_url,
      stackoverflow_url: developer.stackoverflow_url,
      twitter_url: developer.twitter_url,
      github_url: developer.github_url,
      is_active: developer.is_active
    }
  end
end
