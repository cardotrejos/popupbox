defmodule Popupbox.Repo do
  use Ecto.Repo,
    otp_app: :popupbox,
    adapter: Ecto.Adapters.Postgres
end
