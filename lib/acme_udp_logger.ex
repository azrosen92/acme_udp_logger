defmodule AcmeUdpLogger do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = []

    # Starts the main supervision tree, and restart failed children individually.
    opts = [strategy: :one_for_one, name: AcmeUdpLogger.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
