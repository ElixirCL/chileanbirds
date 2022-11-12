defmodule ChileanbirdsWeb.Live.Components.Searchbar do
  use Phoenix.Component

  def render(assigns) do
    ~H"""
      <form phx-change="on:search:change">
        <section class="hero is-info">
          <div class="hero-body">
            <div class="container">
              <div class="columns has-text-centered">
                <div class="column">
                  <h1 class="title is-1">
                    <span role="img" aria-label="chile">
                      🇨🇱
                    </span>
                    Chilean Birds
                    <span role="img" aria-label="bird">
                      🐦
                    </span>
                  </h1>
                </div>
              </div>
              <div class="card">
                <div class="card-content">
                  <div class="content">
                    <div class="control has-icons-left has-icons-right">
                      <input
                        class="input is-large searchbar"
                        type="search"
                        name="search"
                        placeholder="Bird"
                        value=""
                        autoFocus
                      />
                      <span class="icon is-medium is-left">
                        <i class="fa fa-search"></i>
                      </span>
                      <span class="icon is-medium is-right"></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <div class="box cta">
          <div class="columns is-mobile is-centered">
            <div class="field is-grouped is-grouped-multiline"></div>
          </div>
        </div>
      </form>
    """
  end
end
