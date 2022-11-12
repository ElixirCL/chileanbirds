defmodule ChileanbirdsWeb.Live.Pages.Home.Components.Birds.Empty do
  use Phoenix.Component

  def render(assigns) do
    ~H"""
      <section class="container">
        <div class="columns">
          <div class="column is-12">
            <div class="content has-text-centered">
              <span class="icon is-large">
                <h1
                  class="is-title"
                  style={"font-size: 5em; padding-top: 3em"}
                >
                  <i class="fa fa-exclamation-triangle"></i>
                </h1>
              </span>
            </div>
          </div>
        </div>
      </section>
    """
  end
end
