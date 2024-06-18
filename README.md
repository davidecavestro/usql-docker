# usql-docker

Unofficial multiarch docker image for [usql](https://github.com/xo/usql), the universal command-line interface for SQL databases.

Get it from GitHub container registry as

`docker pull ghcr.io/davidecavestro/usql:latest`

or from dockerhub as

`docker pull davidecavestro/usql:latest`

## Usage

You can test it with a local sqlite db, i.e. the following command
`docker run --rm -it -v $(pwd)/data:/data davidecavestro/usql:latest sq://data/test.db`
starts the shell where you can play around as follows
```
me@localhost:~$ docker run --rm -it -v $(pwd)/data:/data davidecavestro/usql:latest sq://data/test.db
Connected with driver sqlite3 (SQLite3 3.38.5)
Type "help" for help.

sq:data/test.db=> CREATE TABLE foo (id int, value text);
CREATE TABLE
sq:data/test.db=> INSERT INTO foo VALUES (1, 'bar');
INSERT 1
sq:data/test.db=> INSERT INTO foo VALUES (2, 'baz');
INSERT 1
sq:data/test.db=> SELECT * FROM foo;
 id | value 
----+-------
  1 | bar 
  2 | baz 
(2 rows)

sq:data/test.db=> \q
```
