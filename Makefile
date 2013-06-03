################################################################################
# Variables
################################################################################

PREFIX=/usr/local
DESTDIR=
BINDIR=${PREFIX}/bin
DATADIR=/var/lib/sky
INCLUDEDIR=${PREFIX}/include
LIBDIR=${PREFIX}/lib

UNAME=$(shell uname)
ifeq ($(UNAME), Darwin)
SOSUFFIX=dylib
endif
ifeq ($(UNAME), Linux)
SOSUFFIX=so
endif

.PHONY: install lmdb luajit

install: clean lmdb luajit

clean:
	${MAKE} clean -C lmdb
	${MAKE} -C LuaJIT-2.0.1 clean PREFIX=${PREFIX}

luajit:
	${MAKE} -C LuaJIT-2.0.1 PREFIX=${PREFIX}
	${MAKE} -C LuaJIT-2.0.1 install PREFIX=${PREFIX}

lmdb:
	${MAKE} -C lmdb PREFIX=${PREFIX}
	${MAKE} -C lmdb install PREFIX=${PREFIX}

