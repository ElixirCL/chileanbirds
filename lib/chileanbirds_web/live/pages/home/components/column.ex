defmodule ChileanbirdsWeb.Live.Pages.Home.Components.Birds.Column do
  use Phoenix.Component

  attr :bird, :map, required: true

  # TODO: Open modal on click
  def render(assigns) do
    ~H"""
    <div
        class="column is-3"
        style={"cursor: pointer"}
        phx-click="on:bird:click"
        phx-value-url={@bird.url}
      >
        <div class="card is-shady">
          <div class="card-image">
            <figure class="image is-4by3">
              <img
                src={@bird.images.thumb}
                alt={@bird.names.latin}
                title={@bird.names.spanish}
                class="modal-button"
                loading="lazy"
              />
            </figure>
          </div>
          <div class="card-content">
            <div class="content">
              <h3 class="title is-3"><%= @bird.names.latin %></h3>
              <p>
                <%= @bird.names.spanish %> / <%= @bird.names.english %>
              </p>
            </div>
          </div>
        </div>
      </div>
    """
  end
end
