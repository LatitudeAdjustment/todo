# Todo

Personal task manager based on following requirements:

https://paper.dropbox.com/doc/Kamana-Code-Sample-KaKg1HqgIPTDlaxb5pFTa

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

Get and compile dependencies.

```bash
$ mix deps.get
```

Compile

```bash
$ mix deps.compile
```

Assets

```bash
$ cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development
```

### Database Setup

Set up the development database by creating it and running the migrations.

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

### Start the Webserver

From the base project folder (todo), start the server.

```bash
mix phx.server
```

## Tests

The unit tests may be run as follows:

```
mix test
```

## Operation

From main/splash page, click Tasks button.
This will bring up Tasks index view.
From here can click New to bring up a modal dialog to enter a new Task.

Tasks have a date time associated with them as "starts".
A new Task has a default date/time of current day, zero hour.
Tasks are considered "daily" and prior tasks are to be deleted.

Task "starts" is stored as local time (not UTC).
Persistence of date/time in UTC and converting to local for client was considered
excessive for this project.

New and edit bring up a modal dialog.

Title is a required field.

## Styling

Considered adding Bootstrap or Tailwind CSS.

Niether was added to project.

### Tailwind CSS

Added Tailwind CSS and then removed following assessment of time requirment to implement.

Installation of Tailwind was based on this:

https://experimentingwithcode.com/using-tailwind-in-phoenix/

Also this:

https://pragmaticstudio.com/tutorials/adding-tailwind-css-to-phoenix

