#ifndef LIBMOLFILE_PLUGIN_H
#define LIBMOLFILE_PLUGIN_H
#include "vmdplugin.h"

#ifdef __cplusplus
extern "C" {
#endif

extern int molfile_gromacsplugin_init(void);
extern int molfile_gromacsplugin_register(void *, vmdplugin_register_cb);
extern int molfile_gromacsplugin_fini(void);
extern int molfile_crdplugin_init(void);
extern int molfile_crdplugin_register(void *, vmdplugin_register_cb);
extern int molfile_crdplugin_fini(void);
extern int molfile_dcdplugin_init(void);
extern int molfile_dcdplugin_register(void *, vmdplugin_register_cb);
extern int molfile_dcdplugin_fini(void);
extern int molfile_parm7plugin_init(void);
extern int molfile_parm7plugin_register(void *, vmdplugin_register_cb);
extern int molfile_parm7plugin_fini(void);
extern int molfile_pdbxplugin_init(void);
extern int molfile_pdbxplugin_register(void *, vmdplugin_register_cb);
extern int molfile_pdbxplugin_fini(void);

#define MOLFILE_INIT_ALL \
    molfile_gromacsplugin_init(); \
    molfile_crdplugin_init(); \
    molfile_dcdplugin_init(); \
    molfile_parm7plugin_init(); \
    molfile_pdbxplugin_init(); \

#define MOLFILE_REGISTER_ALL(v, cb) \
    molfile_gromacsplugin_register(v, cb); \
    molfile_crdplugin_register(v, cb); \
    molfile_dcdplugin_register(v, cb); \
    molfile_parm7plugin_register(v, cb); \
    molfile_pdbxplugin_register(v, cb); \

#define MOLFILE_FINI_ALL \
    molfile_gromacsplugin_fini(); \
    molfile_crdplugin_fini(); \
    molfile_dcdplugin_fini(); \
    molfile_parm7plugin_fini(); \
    molfile_pdbxplugin_fini(); \

#ifdef __cplusplus
}
#endif
#endif
