defmodule FinancessWeb.SaldoHTML do
  use FinancessWeb, :html

  embed_templates "saldo_html/*"

  @doc """
  Renders a saldo form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def saldo_form(assigns)
end
