IASL := iasl

# Automatically gather every .asl file in this directory
SRC := $(wildcard *.asl)
OBJ := $(SRC:.asl=.aml)

all: $(OBJ)

%.aml: %.asl
	$(IASL) $<

.PHONY: all clean
clean:
	$(RM) $(OBJ)
