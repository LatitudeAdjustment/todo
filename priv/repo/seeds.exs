# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todo.Repo.insert!(%Todo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Todo.Repo
alias Todo.Tasks.Task

Repo.insert! %Task{
  starts: ~N[2021-08-17 11:00:00],
  title: "Doctor Appointment",
  description: "15 minute drive",
  completed: false
}

Repo.insert! %Task{
  starts: ~N[2021-08-17 15:00:00],
  title: "Conference Call",
  description: "",
  completed: false
}

Repo.insert! %Task{
  starts: ~N[2021-08-17 19:00:00],
  title: "Groceries",
  description: "",
  completed: false
}
