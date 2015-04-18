MAN_FILES := $(wildcard *.man)
CAT_FILES := $(patsubst %.man,%.cat,$(MAN_FILES))


all: $(CAT_FILES)

clean:
	rm -f $(CAT_FILES)

# Running groff's output through uniq to remove duplicate empty lines. This allows the input to be formatted a bit more loosely.
$(CAT_FILES): %.cat: %.man
	groff -man -T ascii $< | uniq > $@
