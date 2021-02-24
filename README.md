# Ada + GNAT Project Example

The projects in this directory illustrate how to use GNAT with a more elaborate Ada project structure.

* `main.gpr` contains some variable definitions
* `project_1.gpr` is a first project that uses these definitions
* `project_2.gpr` is a second project that uses these definiitions

One interesting feature, besides the 'with' mechanism, is the external variable mechanism, which makes possible defining from outside the project file a variable which is used inside.

The projects use an external variable named 'BUILD' which can be used to change some optimization and some directories. The default value for BUILD is `debug`, but alternatives include `release` and `release_optimized`.

The first way to change the value of BUILD is to use an environment variable:

```sh
$ export BUILD=release
$ gprbuild -P project_1.gpr
$ gprbuild -P project_2.gpr
```

The second way to change this variable is to use the `-X` switch of gnatmake:

```sh
$ gprbuild -XBUILD=release_optimized -P project_1.gpr
$ gprbuild -XBUILD=release_optimized -P project_2.gpr
```
