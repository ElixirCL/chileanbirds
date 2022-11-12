defmodule ChileanbirdsWeb.Live.Components.Navbar do
  use Phoenix.Component

  def render(assigns) do
    ~H"""
      <nav class="navbar nin-color ">
          <div class="container">
            <div class="navbar-brand">
              <div class="navbar-burger burger" data-target="navMenu">
                <span></span>
                <span></span>
                <span></span>
              </div>
            </div>
            <div class="navbar-menu" id="navMenu">
              <div class="navbar-end">
                <div class="navbar-item has-dropdown is-hoverable">
                  <div class="navbar-dropdown">
                    <a href="https://ninjas.cl" class="navbar-item">
                      Ninjas.cl
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </nav>
    """
  end
end
