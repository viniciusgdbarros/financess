defmodule Financess.Repo do
  use Ecto.Repo,
    otp_app: :financess,
    adapter: Ecto.Adapters.Postgres
end
