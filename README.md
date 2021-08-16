# Todo

Personal task manager based on following requirements:

https://paper.dropbox.com/doc/Kamana-Code-Sample-KaKg1HqgIPTDlaxb5pFTa

A very basic CRUD application built with Live View.

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

```bash
$ mix deps.get
```

### Database

Run migrations

```bash
$ mix ecto.setup
```

### Start the Webserver

From the base project folder, start the server.

```bash
$ mix phx.server
```

## CSS

Considered adding Bootstrap or Tailwind CSS.

### Tailwind CSS

Added Tailwind CSS and then removed following assessment of time requirment to implement.

Installation was based on this:

https://experimentingwithcode.com/using-tailwind-in-phoenix/

Also this:

https://pragmaticstudio.com/tutorials/adding-tailwind-css-to-phoenix

