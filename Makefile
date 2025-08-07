IASL := iasl

SRC :=	sample1.asl sample1b.asl sample2.asl sample2b.asl sample3.asl	\
	sample3b.asl sample4.asl

OBJ := $(SRC:.asl=.aml)

all: $(OBJ)

clean: $(PHONY)
	$(RM) $(OBJ)

%.aml: %.asl
	$(IASL) $<
