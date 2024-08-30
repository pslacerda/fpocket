MOLFILE_ARCH     = LINUXAMD64

INCLUDES = -Isrc/qhull/src -Iheaders -Iplugins/include -Iplugins/$(MOLFILE_ARCH)/molfile
LDFLAGS	 = plugins/$(MOLFILE_ARCH)/molfile/libmolfile_plugin.a -lm 
CFLAGS   = -fpermissive

CC = g++
LD = g++
QCC = gcc

SRCS=$(wildcard src/*.c)
OBJS=$(SRCS:.c=.o)


PATH_QHULL = src/qhull/src
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
		$(PATH_OBJ)/clusterlib.o $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o $(PATH_OBJ)/read_mmcif.o \
		$(QOBJS)


$(PATH_QHULL)/%.o: $(PATH_QHULL)/%.c
	$(QCC) $(QCFLAGS) -c $< -o $@ $(INCLUDES)

$(PATH_OBJ)/%.o: $(PATH_OBJ)/%.c
	$(CC) $(QCFLAGS) -c $< -o $@ $(INCLUDES)

FPOCKET_OBJS=$(filter-out src/tpmain.o src/mdpmain.o src/mdpocket.o src/dpmain.o,$(OBJS))

fpocket: $(FPOBJ)
	$(CC) -o ./bin/$@  $(LDFLAGS) $^

all: fpocket

clean:
	rm -f src/*.o
	cd src/qhull && make clean
