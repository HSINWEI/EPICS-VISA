## link visa to an IOC
## assumes $(APPNAME) already defined

ifneq ($(findstring windows,$(EPICS_HOST_ARCH)),)
$(APPNAME)_LIBS += visa64
endif
ifneq ($(findstring win32,$(EPICS_HOST_ARCH)),)
$(APPNAME)_LIBS += visa32
endif
ifneq ($(findstring linux-x86_64,$(EPICS_HOST_ARCH)),)
$(APPNAME)_SYS_LIBS += ivivisa
endif
