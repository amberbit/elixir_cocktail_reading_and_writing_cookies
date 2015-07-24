defmodule CookiesTestApp.PageController do
  use CookiesTestApp.Web, :controller
  use Timex

  def index(conn, _params) do
    expire_date = Date.now |> Date.add(Time.to_timestamp(7, :days))
    secs_to_expire_date = count_seconds_to_expire_date(expire_date)

    conn = Plug.Conn.put_resp_cookie(conn, "some-cookie", "some_cookie")

    conn
      |> put_resp_cookie("first-cookie", "first_cookie", max_age: 7*24*60*60)
      |> put_resp_cookie("second-cookie", "second_cookie", max_age: secs_to_expire_date)
      |> render "index.html"
  end

  def create(conn, params) do
    conn
      |> put_resp_cookie("first-name", params["first_name"])
      |> put_resp_cookie("last-name", params["last_name"])
      |> redirect to: "/"
  end

  defp count_seconds_to_expire_date(date) do
    expire_secs = Date.now |> Date.diff(date, :secs)
    expire_secs
  end
end
