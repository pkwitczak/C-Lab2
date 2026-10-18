CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -Wpedantic -g
CPPFLAGS =
LDFLAGS =
LDLIBS =

TARGET = build/app
SOURCES = $(wildcard src/*.c)
HEADERS = $(wildcard src/*.h)

.DEFAULT_GOAL := all

.PHONY: all run test clean

all: $(TARGET)

$(TARGET): $(SOURCES) $(HEADERS) Makefile | build
	$(CC) $(CPPFLAGS) $(CFLAGS) $(SOURCES) $(LDFLAGS) $(LDLIBS) -o $@

build:
	mkdir -p build

run: $(TARGET)
	./$(TARGET)

test:
	bash tests/run_test.sh

clean:
	rm -f $(TARGET)