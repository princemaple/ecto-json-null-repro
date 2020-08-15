defmodule EctoJson.Post do
  use Ecto.Schema

  schema "posts" do
    field :subject, :string
    field :content, :string
    field :meta, :map
  end
end
