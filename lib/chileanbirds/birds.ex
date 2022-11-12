defmodule Chileanbirds.Birds do
  @endpoint "https://aves.ninjas.cl/api/birds"

  alias Chileanbirds.Bird

  def all() do
    # https://virviil.github.io/2018/04/06/elixir-do-you-have-http-requests-you-are-doing-them-wrong/
    # First, we should start `inets` application.
    # `httpc` is part of it:
    Application.ensure_all_started(:inets)

    # We should start `ssl` application also,
    # if we want to make secure requests:
    Application.ensure_all_started(:ssl)

    # Now we can make request:
    {:ok, {_response, _headers, body}} = :httpc.request(:get, {to_charlist(@endpoint), []}, [], [])
    Jason.decode!(body)
    |> Enum.map(fn item -> Bird.new(item) end)
  end

  def get(url) do
    # https://virviil.github.io/2018/04/06/elixir-do-you-have-http-requests-you-are-doing-them-wrong/
    # First, we should start `inets` application.
    # `httpc` is part of it:
    Application.ensure_all_started(:inets)

    # We should start `ssl` application also,
    # if we want to make secure requests:
    Application.ensure_all_started(:ssl)

    # Now we can make request:
    {:ok, {_response, _headers, body}} = :httpc.request(:get, {to_charlist(url), []}, [], [])
    Jason.decode!(body)
    |> Bird.full()
  end

  def filter(birds, search) do
    Enum.filter(birds, fn bird ->
      String.contains?(bird.search, String.downcase(search))
    end)
  end
end
