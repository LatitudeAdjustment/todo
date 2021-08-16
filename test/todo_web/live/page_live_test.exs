defmodule TodoWeb.PageLiveTest do
  use TodoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Task Manager"
    assert render(page_live) =~ "Welcome to Task Manager"
  end
end
