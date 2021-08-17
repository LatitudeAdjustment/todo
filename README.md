# Todo

Personal task manager based on Code Sample assignment.

A very basic Phoenix CRUD application built with LiveView.

## Authentication

There is no authentication for the application.

Considered use of phx_gen_auth.
However this would require email, SMS integration.

## Getting Started

Clone the repository into a local folder "/todo".

```bash
git clone https://github.com/LatitudeAdjustment/todo.git
```

From the base folder "/todo" get and compile dependencies.

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

From the base project folder "/todo" run ecto.setup to initialize the development
database by creating it and running migrations.

```bash
mix ecto.setup
```

The database initialization steps could be done separately instead of via ecto.setup.
To do so, create the database.

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

From the base project folder "/todo", start the server.

```bash
mix phx.server
```

Or run from within iex.

```bash
iex -S mix phx.server
```

## Operation

From main/splash page on http://localhost:4000/, click Tasks button.
This will bring up Tasks index view.

From Tasks one can click "New Task" link to bring up a modal dialog to enter a
new Task or Edit to bring up an existing Task for modification.

Starts and Title are required fields.
Description is optional.
A task may be marked as completed within the table row.

Tasks have a "starts" date time.
A new Task has a default starts date/time of current day, zero hour.
Tasks are considered "daily" and prior tasks are to be deleted.

Task "starts" is stored as local time (not UTC).
Converting to and from local to UTC for persistence of starts date/time was
considered excessive for this project.

## Tests

The unit tests may be run as follows:

```bash
mix test
```

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
