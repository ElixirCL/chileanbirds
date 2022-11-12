defmodule Chileanbirds.Bird do
  def new(map) do
    %{
      uid: map["uid"],
      names: %{
        spanish: get_in(map, ["name", "spanish"]),
        english: get_in(map, ["name", "english"]),
        latin: get_in(map, ["name", "latin"])
      },
      images: %{
        main: get_in(map, ["images", "main"]),
        full: get_in(map, ["images", "full"]),
        thumb: get_in(map, ["images", "thumb"])
      },
      url: get_in(map, ["_links", "self"]),
      search:
        String.downcase("#{map["name"]["spanish"]} #{map["name"]["english"]} #{map["name"]["latin"]} #{String.replace(map["uid"], "-", " ")}")
        |> String.trim()
    }
  end

  def full(map) do
    Map.merge(new(map), %{
      map: %{
        image: get_in(map, ["map", "image"]),
        title: get_in(map, ["map", "title"])
      },
      order: get_in(map, ["order"]),
      size: get_in(map, ["size"]),
      sort: get_in(map, ["sort"]),
      species: get_in(map, ["species"]),
      didyouknow: get_in(map, ["didyouknow"]),
      habitat: get_in(map, ["habitat"]),
      iucn: %{
        title: get_in(map, ["iucn", "title"]),
        description: get_in(map, ["iucn", "description"])
      }
    })
  end
end
