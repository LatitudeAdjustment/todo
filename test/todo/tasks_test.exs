defmodule Todo.TasksTest do
  use Todo.DataCase

  alias Todo.Tasks

  describe "tasks" do
    alias Todo.Tasks.Task

    @valid_attrs %{title: "some title", description: "some description",
      starts: ~N[2021-08-12 14:00:00], completed: true}
    @update_attrs %{title: "some updated title", description: "some updated description",
      starts: ~N[2021-08-12 14:00:00], completed: false}
    @invalid_attrs %{completed: nil, description: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert_match(Enum.at(Tasks.list_tasks(), 0),  task)
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert_match(Tasks.get_task!(task.id), task)
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tasks.create_task(@valid_attrs)
      assert task.completed == true
      assert task.description == "some description"
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Tasks.update_task(task, @update_attrs)
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert_match(task, Tasks.get_task!(task.id))
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end

    # Match all fields except timestamps
    def assert_match(task1, task2) do
      assert task1.completed == task2.completed
      assert task1.description == task2.description
      assert task1.id == task2.id
      assert task1.title == task2.title
      assert task1.starts == task2.starts
    end
  end
end
