defmodule TodoWeb.TaskLiveTest do
  use TodoWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Todo.Tasks

  @create_attrs %{title: "some title", description: "some description",
    starts: ~N[2021-08-12 14:00:00], completed: true}
  @update_attrs %{title: "some updated title", description: "some updated description",
    starts: ~N[2021-08-12 14:00:00], completed: false}
  @invalid_attrs %{title: nil, description: nil, starts: ~N[2021-08-12 14:00:00], completed: false}

  defp fixture(:task) do
    {:ok, task} = Tasks.create_task(@create_attrs)
    task
  end

  defp create_task(_) do
    task = fixture(:task)
    %{task: task}
  end

  describe "Index" do
    setup [:create_task]

    test "lists all tasks", %{conn: conn, task: task} do
      {:ok, _index_live, html} = live(conn, Routes.task_index_path(conn, :index))

      assert html =~ "Listing Tasks"
      assert html =~ task.description
    end

    test "saves new task", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.task_index_path(conn, :index))

      assert index_live |> element("a", "New Task") |> render_click() =~
               "New Task"

      assert_patch(index_live, Routes.task_index_path(conn, :new))

      assert index_live
             |> form("#task-form", task: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      create_attrs = Map.put(@create_attrs, :title, "Some other title")

      {:ok, _, html} =
        index_live
        |> form("#task-form", task: create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.task_index_path(conn, :index))

      assert html =~ "Task created successfully"
      assert html =~ "some description"
    end

    test "updates task in listing", %{conn: conn, task: task} do
      {:ok, index_live, _html} = live(conn, Routes.task_index_path(conn, :index))

      assert index_live |> element("#task-#{task.id} a", "Edit") |> render_click() =~
               "Edit Task"

      assert_patch(index_live, Routes.task_index_path(conn, :edit, task))

      assert index_live
             |> form("#task-form", task: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#task-form", task: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.task_index_path(conn, :index))

      assert html =~ "Task updated successfully"
      assert html =~ "some updated description"
    end

    test "Click for completed task triggers event", %{conn: conn, task: task} do
      {:ok, index_live, _html} = live(conn, Routes.task_index_path(conn, :index))

      assert index_live |> element("#task-#{task.id}") |> has_element?()

      assert render_click(index_live, "toggle_completed", %{"id" => task.id}) =~ "toggle_completed"
    end

    test "deletes task in listing", %{conn: conn, task: task} do
      {:ok, index_live, _html} = live(conn, Routes.task_index_path(conn, :index))

      assert index_live |> element("#task-#{task.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#task-#{task.id}")
    end
  end

  describe "Show" do
    setup [:create_task]

    test "displays task", %{conn: conn, task: task} do
      {:ok, _show_live, html} = live(conn, Routes.task_show_path(conn, :show, task))

      assert html =~ "Show Task"
      assert html =~ task.description
    end

    test "updates task within modal", %{conn: conn, task: task} do
      {:ok, show_live, _html} = live(conn, Routes.task_show_path(conn, :show, task))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Task"

      assert_patch(show_live, Routes.task_show_path(conn, :edit, task))

      assert show_live
             |> form("#task-form", task: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#task-form", task: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.task_show_path(conn, :show, task))

      assert html =~ "Task updated successfully"
      assert html =~ "some updated description"
    end
  end
end
