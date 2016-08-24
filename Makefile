CC = gcc
CFLAGS = -O3

LIBS = -lm

TARGET = toyfdtd2.x

all: $(TARGET)

.SUFFIXES: .x .c

.c.x:
	$(CC) $(CFLAGS) $< -o $@ $(LIBS)

clean:
	rm -rf *.bob
	rm -rf *.viz

distclean: clean
	rm -rf $(TARGET)
