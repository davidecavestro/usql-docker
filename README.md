# usql-docker

Unofficial docker image for [usql](https://github.com/xo/usql).

Get it from GitHub container registry as

`docker pull ghcr.io/davidecavestro/usql-docker:latest`

or from dockerhub as

`docker pull davidecavestro/usql:latest`

## Usage

```
me@localhost:~$ docker run --rm -it -v $(pwd)/data:/data davidecavestro/usql:latest file:///data/test.db
Connected with driver sqlite3 (SQLite3 3.38.5)
Type "help" for help.

sq:/tmp/test.db=> CREATE TABLE foo (id int, value text);
CREATE TABLE
sq:/tmp/test.db=> INSERT INTO foo VALUES (1, 'bar');
INSERT 1
sq:/tmp/test.db=> INSERT INTO foo VALUES (2, 'baz');
INSERT 1
sq:/tmp/test.db=> SELECT * FROM foo;
 id | value 
----+-------
  1 | bar 
  2 | baz 
(2 rows)

sq:/tmp/test.db=> \q
```