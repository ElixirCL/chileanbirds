defmodule ChileanbirdsWeb.Live.Pages.Home.Components.Modal do
  use Phoenix.Component

  attr :bird, :map, required: true

  def render(assigns) do
    ~H"""
    <div class="modal is-active">
      <div class="modal-background" phx-click="on:modal:close"></div>
      <div class="modal-content">
        <div class="box">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <h3 class="title is-3 has-text-centered">
                  <%= @bird.names.latin %>
                </h3>
                <h4 class="title is-4 has-text-centered">
                  <%= @bird.names.spanish || @bird.names.english %>
                </h4>

                <figure class="image is-4by3">
                  <img
                    src={@bird.images.main}
                    alt={@bird.names.english}
                    title={@bird.names.spanish}
                  />
                </figure>

                <p><%= @bird.didyouknow %></p>
                <p><%= @bird.habitat %></p>

                <p><%= @bird.iucn.title %></p>
                <p><%= @bird.iucn.description %></p>

                <p><%= @bird.order %></p>
                <p><%= @bird.size %></p>
                <p><%= @bird.species %></p>

                <figure class="image is-4by3">
                  <img
                    src={@bird.map.image}
                    alt={@bird.map.title}
                    title={@bird.map.title}
                    width="100%"
                    loading="lazy"
                  />
                </figure>

                <p><%= @bird.map.title %></p>
              </div>
            </div>
          </article>
        </div>
      </div>
      <button
        class="modal-close is-large"
        aria-label="close"
        phx-click="on:modal:close"
      ></button>
    </div>
    """
  end
end
