# Todo

Personal task manager based on Code Sample assignment.

A very basic Phoenix CRUD application built with LiveView.

## Authentication

There is no authentication for the application.

Considered use of phx_gen_auth.
However this would require email, SMS integration.

## Getting Started

Clone the repository.

```bash
git clone https://github.com/LatitudeAdjustment/todo.git
```

From the base folder get and compile dependencies.

```bash
$ cd todo
$ mix deps.get
```

Compile dependencies

```bash
$ mix deps.compile
```

Build assets.

```bash
$ cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development
```

### Database Setup

Run ecto.setup the development database by creating it and running the migrations.

```bash
mix ecto.setup
```

These steps could be done separately.
Create the database.

```bash
mix ecto.create
```

Run migrations.

```bash
mix ecto.migrate
```

Add seed data

One may optionally add a few tasks to the database as follows.

```bash
mix run priv/repo/seeds.exs
```

### Start the Webserver

From the base project folder (todo), start the server.

```bash
mix phx.server
```

Or run from within iex

```bash
iex -S mix phx.server
```

## Tests

The unit tests may be run as follows:

```bash
mix test
```

## Operation

From main/splash page, click Tasks button.
This will bring up Tasks index view.

From Tasks one can click "New Task" link to bring up a modal dialog to enter a
new Task or Edit to bring up an existing Task for modification.

Title is a required field.

Tasks have a "starts" date time.
A new Task has a default starts date/time of current day, zero hour.
Tasks are considered "daily" and prior tasks are to be deleted.

Task "starts" is stored as local time (not UTC).
Converting to and from local to UTC for persistence of starts date/time was
considered excessive for this project.

## Styling

Bootstrap and Tailwind CSS were considered.

Niether was permanently added to project.

Project uses Phoenix default CSS, Milligram, no JavaScript.

### Tailwind CSS

Added Tailwind CSS and then removed it following assessment of time requirement
to implement.

Installation of Tailwind was based on these links:

https://experimentingwithcode.com/using-tailwind-in-phoenix/

https://pragmaticstudio.com/tutorials/adding-tailwind-css-to-phoenix
