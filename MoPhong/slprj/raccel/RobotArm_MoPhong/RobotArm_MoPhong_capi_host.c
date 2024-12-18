#include "RobotArm_MoPhong_capi_host.h"
static RobotArm_MoPhong_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        RobotArm_MoPhong_host_InitializeDataMapInfo(&(root), "RobotArm_MoPhong");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
