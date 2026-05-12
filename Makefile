CPP := $(CPP) -x c -P
IASL := iasl

SOURCE := gnr-d.asl
TARGET := gnr-d.aml gnr-d.dsl

default: $(TARGET)

%.asli: %.asl config.inc defaults.inc asl.inc
	$(CPP) -o $@ $<

%.aml: %.asli
	$(IASL) $<

%.dsl: %.aml
	$(IASL) -d $<
