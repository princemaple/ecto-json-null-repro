defmodule EctoJsonTest do
  use ExUnit.Case
  doctest EctoJson

  alias EctoJson.{Repo, Post}
  import Ecto.Query

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoJson.Repo)
  end

  test "error" do
    post = %Post{subject: "test", content: "test", meta: %{nothing: nil}}
    Repo.insert!(post)

    assert [] = Repo.all(from p in Post, where: is_nil(p.meta["nothing"]))
    assert [_] = Repo.all(from p in Post, where: fragment("?->>? IS NULL", p.meta, "nothing"))

    refute Repo.all(from p in Post, where: is_nil(p.meta["nothing"])) ==
            Repo.all(from p in Post, where: fragment("?->>? IS NULL", p.meta, "nothing"))
  end
end
