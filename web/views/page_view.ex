defmodule CookiesTestApp.PageView do
  use CookiesTestApp.Web, :view

  def hello_message(conn) do
    "Hello #{show_cookie_value(conn, "first-name")} #{show_cookie_value(conn, "last-name")}"
  end

  defp show_cookie_value(conn, cookie) do
    conn.cookies[cookie]
  end
end
