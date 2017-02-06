defmodule AcmeUdpLogger.MessageReceiver do
  use GenServer

  def start_link(opts \\ []) do
    IO.puts opts
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, _socket} = :gen_udp.open(21337)
  end

  # Handle UDP data.
  def handle_info({:udp, _socket, _ip, _port, data}, state) do
    IO.puts inspect(data)
    {:noreply, state}
  end

  # Ignore everything else.
  def handle_info
    {:noreply, state}
  end
end

