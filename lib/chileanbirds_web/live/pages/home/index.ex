defmodule ChileanbirdsWeb.Live.Pages.Home.Index do
  use ChileanbirdsWeb, :live_view

  alias ChileanbirdsWeb.Live.Components.{
    Navbar,
    Searchbar,
    Footer,
    Spinner
  }

  alias ChileanbirdsWeb.Live.Pages.Home.Components.{
    Birds,
    Modal
  }

  @impl true
  def handle_event(
      "on:search:change",
      %{"_target" => ["search"], "search" => search},
      socket
    ) do

      search = String.trim(search)
      filtered_birds = case search == "" do
        true -> socket.assigns.all_birds
        false -> Chileanbirds.Birds.filter(socket.assigns.all_birds, search)
      end

      {:noreply, assign(socket, :birds, filtered_birds)}
  end

  def handle_event(
      "on:bird:click",
      %{"url" => url},
      socket
    ) do
      {:noreply,
        assign(socket, :bird, Chileanbirds.Birds.get(url))
        |> assign(:modal, true)
      }
  end

  def handle_event(
      "on:modal:close",
      _values,
      socket
    ) do
      {:noreply,
        assign(socket, :modal, false)
      }
  end

  @impl true
  def preload(all_assigns) do
    Enum.map(all_assigns, fn assigns ->
      assigns
      |> Map.put(:loading, true)
      |> Map.put(:all_birds, [])
      |> Map.put(:birds, [])
      |> Map.put(:bird, %{})
      |> Map.put(:modal, false)
    end)
  end

  @impl true
  def mount(_params, _session, socket) do
    all_birds = Chileanbirds.Birds.all()
    {:ok,
      socket
      |> assign(:all_birds, all_birds)
      |> assign(:birds, all_birds)
      |> assign(:loading, false)
      |> assign(:modal, false)
      |> assign(:bird, %{})
    }
  end

  @impl true
  def render(%{loading: false} = assigns) do
    ~H"""
      <Navbar.render />
      <Searchbar.render />
      <Birds.render birds={@birds}/>
      <Modal.render :if={@modal} bird={@bird} />
      <Footer.render />
    """
  end

  def render(%{loading: true} = assigns) do
    ~H"""
      <Navbar.render />
      <Spinner.render />
      <Footer.render />
    """
  end
end
