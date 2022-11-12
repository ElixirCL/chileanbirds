defmodule ChileanbirdsWeb.Live.Components.Footer do
  use Phoenix.Component

  def render(assigns) do
    ~H"""
      <footer class="footer">
        <div class="content has-text-centered">
          <p>
            <strong>Chilean Birds</strong> by
            <a href="https://ninjas.cl">Camilo Castro</a>.
          </p>

          <p>
            Using Scrapped Data from
            <a href="http://www.buscaves.cl/"> Buscaves.cl</a>.
          </p>

          <p>
            <a href="https://github.com/elixircl/chileanbirds">Made with Elixir and Phoenix (Github)</a>
          </p>
        </div>
      </footer>
    """
  end
end
