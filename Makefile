SHELL := /bin/bash

CC:= gcc
CCFLAGS :=-Wall -O2 -std=gnu11

PATH-PROJECT := $(shell pwd)
PATH-BIN := $(PATH-PROJECT)/bin
PATH-OBJECTS := $(PATH-BIN)

COLOR_BRIGHT_GREEN = \x1B[1;32m
COLOR_BRIGHT_YELLOW = \x1B[1;33m
COLOR_BRIGHT_MAGENTA = \x1B[1;35m
COLOR_BRIGHT_CYAN = \x1B[1;36m
COLOR_DIM_GREEN = \x1B[2;32m
COLOR_DIM_YELLOW = \x1B[2;33m
COLOR_DIM_MAGENTA = \x1B[2;35m
COLOR_DIM_CYAN = \x1B[2;36m
COLOR_RESET=\033[0m


log_h6 = @echo \
	-e \
	"${COLOR_BRIGHT_CYAN}=======>${COLOR_DIM_CYAN} ${COLOR_BRIGHT_GREEN}$(1)${COLOR_RESET}"


.DEFAULT: default
.PHONY: all default build
.PHONY: clean

default: build
build: ensure-bin time-test time-static time-dynamic


clean:
	$(call log_h6,"clean")
	rm -rvf \
		$(PATH-OBJECTS)/*

ensure-bin:
	mkdir -p $(PATH-BIN)

$(PATH-OBJECTS)/time.o: time.c
	$(CC) $(CCFLAGS) -c -fPIC $< -o $@

$(PATH-OBJECTS)/time-test.o: time-test.c
	$(CC) $(CCFLAGS) -o $@ -c $<

time-test: \
	$(PATH-OBJECTS)/time-test.o \
	$(PATH-OBJECTS)/time.o
	$(CC) $(CCFLAGS) -o $(PATH-BIN)/$@ $+ $(LDFLAGS)

time-static:
	ar -cvq $(PATH-OBJECTS)/libtime.a $(PATH-OBJECTS)/time.o

time-dynamic:
	$(CC) $(PATH-OBJECTS)/time.o -shared -o $(PATH-OBJECTS)/libtime.so