defmodule ChileanbirdsWeb.Live.Pages.Home.Components.Birds do
  use Phoenix.Component

  alias __MODULE__.{
    Column,
    Empty
  }

  defp table(assigns, []) do
    Empty.render(assigns)
  end

  defp table(assigns, _) do
    columns_per_row = 4
    ~H"""
    <%= for cols <- Enum.chunk_every(assigns.birds, columns_per_row) do %>
      <div class="columns features">
        <%= for bird <- cols do %>
          <Column.render bird={bird} />
        <% end %>
      </div>
    <% end %>
    """
  end

  attr :birds, :list, default: []

  def render(assigns) do
    ~H"""
    <section class="container">
      <%= table(assigns, @birds) %>
    </section>
    """
  end
end
