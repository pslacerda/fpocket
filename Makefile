MOLFILE_ARCH     = LINUXAMD64

INCLUDES = -Iqhull/src -Iheaders -Iplugins/include -Iplugins/include -Iplugins/$(MOLFILE_ARCH)/molfile
LDFLAGS	 = plugins/$(MOLFILE_ARCH)/molfile/libmolfile_plugin.a -lm 
CFLAGS   = -fpermissive

CC = g++
LD = g++
QCC = gcc

SRCS=$(wildcard src/*.c)
OBJS=$(SRCS:.c=.o)


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
		$(PATH_OBJ)/clusterlib.o $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o $(PATH_OBJ)/read_mmcif.o \
		$(QOBJS)

TPOBJ = $(PATH_OBJ)/tpmain.o $(PATH_OBJ)/psorting.o $(PATH_OBJ)/pscoring.o \
		$(PATH_OBJ)/utils.o $(PATH_OBJ)/pertable.o $(PATH_OBJ)/memhandler.o \
		$(PATH_OBJ)/voronoi.o $(PATH_OBJ)/sort.o $(PATH_OBJ)/calc.o \
		$(PATH_OBJ)/writepdb.o $(PATH_OBJ)/rpdb.o $(PATH_OBJ)/tparams.o \
		$(PATH_OBJ)/fparams.o $(PATH_OBJ)/pocket.o $(PATH_OBJ)/refine.o \
		$(PATH_OBJ)/tpocket.o  $(PATH_OBJ)/descriptors.o \
		$(PATH_OBJ)/aa.o $(PATH_OBJ)/fpocket.o $(PATH_OBJ)/write_visu.o \
		$(PATH_OBJ)/fpout.o $(PATH_OBJ)/atom.o $(PATH_OBJ)/writepocket.o \
		$(PATH_OBJ)/voronoi_lst.o $(PATH_OBJ)/neighbor.o $(PATH_OBJ)/asa.o\
		$(PATH_OBJ)/clusterlib.o  $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o $(PATH_OBJ)/read_mmcif.o\
		$(QOBJS)

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
		$(PATH_OBJ)/topology.o \
		$(QOBJS) 

MDPOBJ = $(PATH_OBJ)/mdpmain.o $(PATH_OBJ)/mdpocket.o $(PATH_OBJ)/mdpbase.o $(PATH_OBJ)/mdpout.o $(PATH_OBJ)/psorting.o $(PATH_OBJ)/pscoring.o \
		$(PATH_OBJ)/mdparams.o $(PATH_OBJ)/voronoi.o \
		$(PATH_OBJ)/sort.o  $(PATH_OBJ)/rpdb.o $(PATH_OBJ)/descriptors.o \
		$(PATH_OBJ)/neighbor.o $(PATH_OBJ)/atom.o $(PATH_OBJ)/aa.o \
		$(PATH_OBJ)/pertable.o $(PATH_OBJ)/calc.o $(PATH_OBJ)/utils.o \
		$(PATH_OBJ)/writepdb.o $(PATH_OBJ)/memhandler.o $(PATH_OBJ)/pocket.o \
		$(PATH_OBJ)/refine.o $(PATH_OBJ)/fparams.o \
		$(PATH_OBJ)/fpocket.o $(PATH_OBJ)/fpout.o \
		$(PATH_OBJ)/writepocket.o $(PATH_OBJ)/write_visu.o $(PATH_OBJ)/asa.o $(PATH_OBJ)/read_mmcif.o\
		$(PATH_OBJ)/voronoi_lst.o $(PATH_OBJ)/clusterlib.o $(PATH_OBJ)/energy.o $(PATH_OBJ)/topology.o \
		$(QOBJS) 



$(PATH_QHULL)/%.o: $(PATH_QHULL)/%.c
	$(QCC) -c $(QCFLAGS) $< -o $@ $(INCLUDES)

$(PATH_OBJ)/%.o: $(PATH_OBJ)/%.c
	$(CC) $(QCFLAGS) -c $< -o $@ $(INCLUDES)


FPOCKET_OBJS=$(filter-out src/tpmain.o src/mdpmain.o src/mdpocket.o src/dpmain.o,$(OBJS))

all: fpocket tpocket dpocket mdpocket

fpocket: $(FPOBJ)
	$(CC) -o ./bin/$@ $^ $(LDFLAGS)

tpocket: $(TPOBJ)
	$(CC) -o ./bin/$@ $^ $(LDFLAGS)

dpocket: $(DPOBJ)
	$(CC) -o ./bin/$@ $^ $(LDFLAGS)

mdpocket: $(MDPOBJ)
	$(CC) -o ./bin/$@ $^ $(LDFLAGS)


clean:
	rm -f src/*.o
	cd qhull && make clean
