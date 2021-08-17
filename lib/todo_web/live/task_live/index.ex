defmodule TodoWeb.TaskLive.Index do
  use TodoWeb, :live_view

  alias Todo.Tasks
  alias Todo.Tasks.Task

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :tasks, list_tasks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Task")
    |> assign(:task, Tasks.get_task!(id))
  end

  defp apply_action(socket, :new, _params) do
    task = %Task{}
    task = put_in(task.starts, today())

    socket
    |> assign(:page_title, "New Task")
    |> assign(:task, task)
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tasks")
    |> assign(:task, nil)
  end

  defp today() do
    today = DateTime.now!("Etc/UTC")
    %{year: today.year, month: today.month, day: today.day, hour: 0,
      minute: 0, second: 0}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    task = Tasks.get_task!(id)
    {:ok, _} = Tasks.delete_task(task)

    {:noreply, assign(socket, :tasks, list_tasks())}
  end

  @impl true
  def handle_event("toggle_completed", %{"id" => id}, socket) do
    task = Tasks.get_task!(id)
    Tasks.update_task(task, %{completed: !task.completed})
    {:noreply, socket}
  end

  defp list_tasks do
    Tasks.list_tasks()
  end
end
