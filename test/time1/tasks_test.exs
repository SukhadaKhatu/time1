defmodule Time1.TasksTest do
  use Time1.DataCase

  alias Time1.Tasks

  describe "task" do
    alias Time1.Tasks.Task

    @valid_attrs %{approved: true, description: "some description", name: "some name", time_spent: "some time_spent"}
    @update_attrs %{approved: false, description: "some updated description", name: "some updated name", time_spent: "some updated time_spent"}
    @invalid_attrs %{approved: nil, description: nil, name: nil, time_spent: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task()

      task
    end

    test "list_task/0 returns all task" do
      task = task_fixture()
      assert Tasks.list_task() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tasks.create_task(@valid_attrs)
      assert task.approved == true
      assert task.description == "some description"
      assert task.name == "some name"
      assert task.time_spent == "some time_spent"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Tasks.update_task(task, @update_attrs)
      assert task.approved == false
      assert task.description == "some updated description"
      assert task.name == "some updated name"
      assert task.time_spent == "some updated time_spent"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
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
  end
end
