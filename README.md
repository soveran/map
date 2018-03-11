# map

Map lines from stdin to commands.

Description
-----------

Map lets you process each line from stdin with a command of your
choice. For example:

```shell
$ ls
LICENSE   README.md makefile  map.1   map.c
```

```shell
$ ls | map f 'echo $f $f'
LICENSE LICENSE
README.md README.md
makefile makefile
map.1 map.1
map.c map.c
```

Note that the command must be wrapped in single quotes to prevent
the variable from being expanded by the shell.

Installation
------------

Install map into `/usr/local/bin` with the following command:

    $ make install

You can use `make PREFIX=/some/other/directory install` if you wish
to use a different destination. If you want to remove map from
your system, use `make uninstall`.

Motivation
----------

There are many ways to accomplish what you can do with `map`,
including shell builtins, `find`, `awk`, etc. The approach taken
by `map` is extremely pragmatic and allows me to express concisely
what I want. Given the fact that it's designed as a filter, it can
operate on any kind of list, not only lists of files.

Contributing
------------

If you find a bug, please create an issue detailing the ways to
reproduce it. If you have a suggestion, create an issue detailing
the use case.
