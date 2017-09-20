defmodule TodoWeb.TopicController do
  use TodoWeb, :controller

  alias Todo.Topic
  alias Todo.Repo

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, topic} -> IO.inspect(topic)
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
