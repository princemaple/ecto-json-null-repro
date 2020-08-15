defmodule EctoJson.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table("posts") do
      add :subject, :string, null: false
      add :content, :text
      add :meta, :map
    end
  end
end
