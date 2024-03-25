# Nightscout && FerretDB

Inspired by [Nightscout](https://github.com/nightscout/cgm-remote-monitor) and [FerretDB](https://github.com/FerretDB/FerretDB) I decided that it might be a good idea to combine those two and build an alternative solution for [this issue](https://github.com/nightscout/cgm-remote-monitor/issues/7649).

## How to run tests

```sh
# Download Nightscout source code
$ git clone https://github.com/nightscout/cgm-remote-monitor.git

# Run tests
$ make mongodb           # test against mongodb
$ make ferretdb-sqlite   # test against sqlite
$ make ferretdb-postgres # test against postgres
```

## Play with FerretDB

If you're interested in how FerretDB stores the data you can go into `./volumes/{sqlite,postgres}` directories created by make scripts and check the data.

For SQLite it's going to be something like

```sh
$ sqlite3 ./data/sqlite/state/nightscout.sqlite
```

For Postgres you can use the `ferretdb-postgres.yml` file

```sh
$ docker compose -f ferretdb-postgres.yml up -d
$ psql postgres://username:password@127.0.0.1:5432/ferretdb
```
