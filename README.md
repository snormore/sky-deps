Sky Dependencies
================

## Overview

The Sky database relies on two awesome C libraries to run:

* [LuaJIT 2.0.1](http://luajit.org/)
* [LMDB](http://symas.com/mdb/)

The current versions of both of these libraries are store in the `sky-deps` repository.


# Installation

To install the dependencies:

```sh
$ git clone https://github.com/skydb/sky-deps.git
$ cd sky-deps
$ sudo make install
```

NOTE: You only need to install the Sky dependencies once.