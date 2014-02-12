################################################################################
# Variables
################################################################################

PREFIX=/usr/local
[ -z "$DESTDIR" ] && DESTDIR=""
BINDIR=${PREFIX}/bin
[ -z "$DATADIR" ] && DATADIR="/var/lib/sky"
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

install: clean setup lmdb luajit

setup:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${PREFIX}/lib
	mkdir -p ${DESTDIR}${PREFIX}/include
	mkdir -p ${DESTDIR}${PREFIX}/man/man1

clean:
	${MAKE} clean -C lmdb
	${MAKE} -C LuaJIT-2.0.1 clean PREFIX=${PREFIX}

luajit:
	${MAKE} -C LuaJIT-2.0.1 PREFIX=${PREFIX} DESTDIR=${DESTDIR}
	${MAKE} -C LuaJIT-2.0.1 install PREFIX=${PREFIX} DESTDIR=${DESTDIR}

lmdb:
	${MAKE} -C lmdb PREFIX=${PREFIX} DESTDIR=${DESTDIR}
	${MAKE} -C lmdb install PREFIX=${PREFIX} DESTDIR=${DESTDIR}

