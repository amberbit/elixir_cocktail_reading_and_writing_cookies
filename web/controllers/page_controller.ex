defmodule CookiesTestApp.PageController do
  use CookiesTestApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, params) do
    conn
      |> put_resp_cookie("first-name", params["first_name"])
      |> put_resp_cookie("last-name", params["last_name"])
      |> redirect to: "/"
  end
end
