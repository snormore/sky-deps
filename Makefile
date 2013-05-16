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

.PHONY: install leveldb luajit

install: clean leveldb luajit

clean:
	${MAKE} clean -C leveldb-1.9.0
	${MAKE} -C LuaJIT-2.0.1 clean PREFIX=${PREFIX}

leveldb:
	${MAKE} clean -C leveldb-1.9.0
	${MAKE} -C leveldb-1.9.0
	install -m 755 -d ${DESTDIR}${INCLUDEDIR}/leveldb
	install -m 755 leveldb-1.9.0/include/leveldb/* ${DESTDIR}${INCLUDEDIR}/leveldb
	install -m 755 -d ${DESTDIR}${LIBDIR}
	install -m 755 leveldb-1.9.0/libleveldb.a ${DESTDIR}${LIBDIR}
	install -m 755 leveldb-1.9.0/libleveldb.${SOSUFFIX}.1.9 ${DESTDIR}${LIBDIR}
	ln -sf ${DESTDIR}${LIBDIR}/libleveldb.${SOSUFFIX}.1.9 ${DESTDIR}${LIBDIR}/libleveldb.${SOSUFFIX}.1
	ln -sf ${DESTDIR}${LIBDIR}/libleveldb.${SOSUFFIX}.1.9 ${DESTDIR}${LIBDIR}/libleveldb.${SOSUFFIX}

luajit:
	${MAKE} -C LuaJIT-2.0.1 PREFIX=${PREFIX}
	${MAKE} -C LuaJIT-2.0.1 install PREFIX=${PREFIX}

