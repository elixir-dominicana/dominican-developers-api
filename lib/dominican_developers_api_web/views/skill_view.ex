defmodule DominicanDevelopersApiWeb.SkillView do
  use DominicanDevelopersApiWeb, :view
  alias DominicanDevelopersApiWeb.SkillView

  def render("index.json", %{skills: skills}) do
    %{data: render_many(skills, SkillView, "skill.json")}
  end

  def render("show.json", %{skill: skill}) do
    %{data: render_one(skill, SkillView, "skill.json")}
  end

  def render("skill.json", %{skill: skill}) do
    %{
      id: skill.id,
      name: skill.name
    }
  end
end
