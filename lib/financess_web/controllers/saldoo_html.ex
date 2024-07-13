defmodule FinancessWeb.SaldooHTML do
  use FinancessWeb, :html

  embed_templates "saldoo_html/*"

  @doc """
  Renders a saldoo form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def saldoo_form(assigns)
end
