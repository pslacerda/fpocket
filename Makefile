
BINDIR=/usr/local/bin
MANDIR=/usr/local/man/man8


SHELL := bash -O extglob


ifeq ($(TARGET_OS),LINUXAMD64)
CC 	    = gcc
CFLAGS  = -fPIE
QCC     = gcc
QCFLAGS = -fPIE
LINKER  = gcc
else ifeq ($(TARGET_OS),WIN64)
MOLFILE_ARCH = WIN64
CC 	   = x86_64-w64-mingw32-gcc
CFLAGS  = -D__USE_MINGW_ANSI_STDIO=0 -D_WIN32
QCC    = x86_64-w64-mingw32-gcc
QCFLAGS =
LINKER = x86_64-w64-mingw32-gcc
endif

LFLAGS = -static
LIBS   = vmd_molfile/$(TARGET_OS)/libmolfile_plugin.a -lm -lstdc++
INCS   = -Iqhull/src -Iheaders -Ivmd_molfile -Ivmd_molfile/$(TARGET_OS)


PATH_QHULL = qhull/src
PATH_OBJ = src

QOBJS = $(PATH_QHULL)/libqhull/geom2.o $(PATH_QHULL)/libqhull/geom.o $(PATH_QHULL)/libqhull/global.o \
        $(PATH_QHULL)/libqhull/io.o $(PATH_QHULL)/libqhull/libqhull.o \
        $(PATH_QHULL)/libqhull/mem.o $(PATH_QHULL)/libqhull/merge.o $(PATH_QHULL)/libqhull/poly2.o \
        $(PATH_QHULL)/libqhull/poly.o $(PATH_QHULL)/libqhull/qset.o \
        $(PATH_QHULL)/libqhull/random.o $(PATH_QHULL)/libqhull/rboxlib.o \
        $(PATH_QHULL)/libqhull/stat.o $(PATH_QHULL)/libqhull/user.o \
        $(PATH_QHULL)/libqhull/usermem.o \
        $(PATH_QHULL)/libqhull/userprintf.o $(PATH_QHULL)/libqhull/userprintf_rbox.o $(PATH_QHULL)/qvoronoi/qvoronoi.o $(PATH_QHULL)/qconvex/qconvex.o



FPOBJ = $(PATH_OBJ)/fpmain.o $(PATH_OBJ)/psorting.o $(PATH_OBJ)/pscoring.o \
		$(PATH_OBJ)/utils.o $(PATH_OBJ)/pertable.o $(PATH_OBJ)/memhandler.o \
		$(PATH_OBJ)/voronoi.o $(PATH_OBJ)/sort.o $(PATH_OBJ)/calc.o \
		$(PATH_OBJ)/writepdb.o $(PATH_OBJ)/rpdb.o $(PATH_OBJ)/tparams.o \
		$(PATH_OBJ)/fparams.o $(PATH_OBJ)/pocket.o $(PATH_OBJ)/refine.o \
		$(PATH_OBJ)/descriptors.o $(PATH_OBJ)/aa.o \
		$(PATH_OBJ)/fpocket.o $(PATH_OBJ)/write_visu.o  $(PATH_OBJ)/fpout.o \
		$(PATH_OBJ)/atom.o $(PATH_OBJ)/writepocket.o $(PATH_OBJ)/voronoi_lst.o $(PATH_OBJ)/asa.o \
		$(PATH_OBJ)/clusterlib.o $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o $(PATH_OBJ)/read_mmcif.o

TPOBJ = $(PATH_OBJ)/tpmain.o $(PATH_OBJ)/psorting.o $(PATH_OBJ)/pscoring.o \
		$(PATH_OBJ)/utils.o $(PATH_OBJ)/pertable.o $(PATH_OBJ)/memhandler.o \
		$(PATH_OBJ)/voronoi.o $(PATH_OBJ)/sort.o $(PATH_OBJ)/calc.o \
		$(PATH_OBJ)/writepdb.o $(PATH_OBJ)/rpdb.o $(PATH_OBJ)/tparams.o \
		$(PATH_OBJ)/fparams.o $(PATH_OBJ)/pocket.o $(PATH_OBJ)/refine.o \
		$(PATH_OBJ)/tpocket.o  $(PATH_OBJ)/descriptors.o \
		$(PATH_OBJ)/aa.o $(PATH_OBJ)/fpocket.o $(PATH_OBJ)/write_visu.o \
		$(PATH_OBJ)/fpout.o $(PATH_OBJ)/atom.o $(PATH_OBJ)/writepocket.o \
		$(PATH_OBJ)/voronoi_lst.o $(PATH_OBJ)/neighbor.o $(PATH_OBJ)/asa.o\
		$(PATH_OBJ)/clusterlib.o  $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o $(PATH_OBJ)/read_mmcif.o
DPOBJ = $(PATH_OBJ)/dpmain.o $(PATH_OBJ)/psorting.o $(PATH_OBJ)/pscoring.o \
		$(PATH_OBJ)/dpocket.o $(PATH_OBJ)/dparams.o  $(PATH_OBJ)/voronoi.o \
		$(PATH_OBJ)/sort.o  $(PATH_OBJ)/rpdb.o $(PATH_OBJ)/descriptors.o \
		$(PATH_OBJ)/neighbor.o $(PATH_OBJ)/atom.o $(PATH_OBJ)/aa.o \
		$(PATH_OBJ)/pertable.o $(PATH_OBJ)/calc.o $(PATH_OBJ)/utils.o \
		$(PATH_OBJ)/writepdb.o $(PATH_OBJ)/memhandler.o $(PATH_OBJ)/pocket.o \
		$(PATH_OBJ)/refine.o $(PATH_OBJ)/fparams.o \
		$(PATH_OBJ)/fpocket.o $(PATH_OBJ)/fpout.o $(PATH_OBJ)/writepocket.o \
		$(PATH_OBJ)/write_visu.o $(PATH_OBJ)/asa.o $(PATH_OBJ)/read_mmcif.o\
		$(PATH_OBJ)/voronoi_lst.o $(PATH_OBJ)/clusterlib.o $(PATH_OBJ)/energy.o \
		$(PATH_OBJ)/topology.o

MDPOBJ = $(PATH_OBJ)/mdpmain.o $(PATH_OBJ)/mdpocket.o $(PATH_OBJ)/mdpbase.o $(PATH_OBJ)/mdpout.o $(PATH_OBJ)/psorting.o $(PATH_OBJ)/pscoring.o \
		$(PATH_OBJ)/mdparams.o $(PATH_OBJ)/voronoi.o \
		$(PATH_OBJ)/sort.o  $(PATH_OBJ)/rpdb.o $(PATH_OBJ)/descriptors.o \
		$(PATH_OBJ)/neighbor.o $(PATH_OBJ)/atom.o $(PATH_OBJ)/aa.o \
		$(PATH_OBJ)/pertable.o $(PATH_OBJ)/calc.o $(PATH_OBJ)/utils.o \
		$(PATH_OBJ)/writepdb.o $(PATH_OBJ)/memhandler.o $(PATH_OBJ)/pocket.o \
		$(PATH_OBJ)/refine.o $(PATH_OBJ)/fparams.o \
		$(PATH_OBJ)/fpocket.o $(PATH_OBJ)/fpout.o \
		$(PATH_OBJ)/writepocket.o $(PATH_OBJ)/write_visu.o $(PATH_OBJ)/asa.o $(PATH_OBJ)/read_mmcif.o\
		$(PATH_OBJ)/voronoi_lst.o $(PATH_OBJ)/clusterlib.o $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o
		


$(PATH_QHULL)/%.o: $(PATH_QHULL)/%.c
	$(QCC) $(QCFLAGS) -c $< -o $@ $(INCS)

$(PATH_OBJ)/%.o: $(PATH_OBJ)/%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(INCS)


all: fpocket tpocket dpocket mdpocket

fpocket: $(FPOBJ) $(QOBJS)
	$(LINKER) $(LFLAGS) -o ./bin/$@ $^ $(LIBS)

tpocket: $(TPOBJ) $(QOBJS)
	$(LINKER) $(LFLAGS) -o ./bin/$@ $^ $(LIBS)

dpocket: $(DPOBJ) $(QOBJS)
	$(LINKER) $(LFLAGS) -o ./bin/$@ $^ $(LIBS)

mdpocket: $(MDPOBJ) $(QOBJS)
	$(LINKER) $(LFLAGS) -o ./bin/$@ $^ $(LIBS)

clean:
	rm -f src/*.o bin/*
	cd qhull && make clean

install: all
	mkdir -p $(BINDIR)
	mkdir -p $(MANDIR)
	cp bin/{fpocket,tpocket,dpocket,mdpocket} $(BINDIR)
	cp man/*.8 $(MANDIR)

uninstall:
	rm -f $(BINDIR)/{fpocket,tpocket,dpocket,mdpocket}
	rm -f $(MANDIR)/{fpocket,tpocket,dpocket}.8
	