RUN=true
TARGET=$(shell gcc -dumpmachine)
GPRBUILD_TARGET=--target=$(TARGET)
RM= rm -f
SHELL=sh
EXE=
S=/
CDir=./
PREFIX=
CROSS=false

ifneq ($(findstring mingw32,$(TARGET)),)
    CYGWIN=false
    EXE=.exe

    ifneq ($(CYGWIN), true)
        CDir=
        RM=cmd.exe /c del
        SHELL=cmd.exe
        S='\'
    endif
endif

ifeq ($(CROSS),false)
    FULL_PROJECT_TARGETS = project_1 project_2
else
    FULL_PROJECT_TARGETS = project_1
endif

full_project: project_1 project_2

project_1:
    gprbuild $(GPRBUILD_TARGET) -P project_1.gpr
ifeq ($(RUN),true)
    bin$(S)debug$(S)text_io_example$(EXE)
    bin$(S)debug$(S)test_el_funcs$(EXE)
    bin$(S)debug$(S)test_generic_el_funcs$(EXE)
endif
    gprbuild $(GPRBUILD_TARGET) -f -XBUILD=release_optimized -P project_1.gpr

project_2:
    gprbuild $(GPRBUILD_TARGET) -P project_2.gpr
ifeq ($(RUN),true)
    prog$(S)debug$(S)test_cl$(EXE)
endif
    gprbuild $(GPRBUILD_TARGET) -f -XBUILD=release_optimized -P project_2.gpr

clean:
    gprclean $(GPRBUILD_TARGET) -P project_1.gpr
    gprclean $(GPRBUILD_TARGET) -f -XBUILD=release_optimized -P project_1.gpr
    gprclean $(GPRBUILD_TARGET) -P project_2.gpr
    gprclean $(GPRBUILD_TARGET) -f -XBUILD=release_optimized -P project_2.gpr

.PHONY: project_1 project_2 clean
