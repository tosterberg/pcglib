CC=gcc
CFLAGS=-Wall -g
BINS=libpcg.o libpcg.dll libstaticpcg.a librarytest static_librarytest runtime_librarytest

all: $(BINS)

libpcg.o: libpcg.c pcg.h
	$(CC) $(CFLAGS) -c libpcg.c

libpcg.dll: libpcg.c pcg.h
	$(CC) $(CFLAGS) -fPIC -shared -o $@ libpcg.c

libstaticpcg.a: libpcg.o
	ar rcs libstaticpcg.a libpcg.o

librarytest: librarytest.c libpcg.o
	$(CC) $(CFLAGS) -o $@ $^

static_librarytest: librarytest.c
	$(CC) $(CFLAGS) -o $@ $^ -L. -lstaticpcg

runtime_librarytest: librarytest.c
	$(CC) $(CFLAGS) -o $@ $^ -L. -lpcg

clean:
	del *.o *.exe *.so *.dll *.a