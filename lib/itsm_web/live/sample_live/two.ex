defmodule ItsmWeb.SampleLive.Two do
  use ItsmWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
