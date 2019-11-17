TOPTARGETS := all clean test bundle build

SUBDIRS := \
	entrystep

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	@echo $@: $(MAKECMDGOALS)
	@$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(SUBDIRS)
