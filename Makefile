IASL := iasl

SRC := sample1.asl sample2.asl sample3.asl sample3b.asl

OBJ := $(SRC:.asl=.aml)

all: $(OBJ)

clean: $(PHONY)
	$(RM) $(OBJ)

%.aml: %.asl
	$(IASL) $<
