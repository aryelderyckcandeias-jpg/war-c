CC     ?= gcc
CFLAGS ?= -std=c11 -Wall -Wextra -g
PROGS  := territorios_cadastro war_missoes

.PHONY: all clean

all: $(PROGS)

%: src/%.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(PROGS) $(addsuffix .exe,$(PROGS))
