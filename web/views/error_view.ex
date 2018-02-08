defmodule Rumbl.ErrorView do
  use Rumbl.Web, :view

  # note that these use render directly from the view, rather than going through a template
  # This is because it's all just functions, functions all the way down
  # And render is just passed a page and assigns and returns a tuple for HTML safety
  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
