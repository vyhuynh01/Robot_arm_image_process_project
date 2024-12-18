#ifndef RTW_HEADER_RobotArm_MoPhong_h_
#define RTW_HEADER_RobotArm_MoPhong_h_
#ifndef RobotArm_MoPhong_COMMON_INCLUDES_
#define RobotArm_MoPhong_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#include "nesl_rtw.h"
#include "RobotArm_MoPhong_3ef711a9_1_gateway.h"
#endif
#include "RobotArm_MoPhong_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME RobotArm_MoPhong
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (6) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (0)   
#elif NCSTATES != 0
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T gc2rwfhdpe [ 4 ] ; real_T mwyt50uswv [ 4 ] ; real_T
g0cexmykeo [ 4 ] ; real_T c4qwq0e1ts ; real_T fpjxuqvqdc ; real_T etlmf0cqeb
; } B ; typedef struct { real_T mmepq1csxt [ 2 ] ; real_T pndypzrey1 [ 2 ] ;
real_T m2u55i2bak [ 2 ] ; real_T mu45enlw35 ; void * bbbu1uieh0 ; void *
eyhnhtttw2 ; void * ngn3nddn2j ; void * ge3n20fmj4 ; void * ofnnfkg5qp ; void
* gq3lj1qs4h ; void * pkqtisajiv ; void * e4ncm1dzgm ; int_T kdh5qwt13s ;
boolean_T pwf53itzjd ; } DW ; typedef struct { rtwCAPI_ModelMappingInfo mmi ;
} DataMapInfo ; struct P_ { real_T SliderGain1_gain ; real_T SliderGain2_gain
; real_T SliderGain3_gain ; real_T Constant1_Value ; real_T Gain1_Gain ;
real_T Constant2_Value ; real_T Gain2_Gain ; real_T Constant3_Value ; real_T
Gain3_Gain ; } ; extern const char * RT_MEMORY_ALLOCATION_ERROR ; extern B
rtB ; extern DW rtDW ; extern P rtP ; extern mxArray *
mr_RobotArm_MoPhong_GetDWork ( ) ; extern void mr_RobotArm_MoPhong_SetDWork (
const mxArray * ssDW ) ; extern mxArray *
mr_RobotArm_MoPhong_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * RobotArm_MoPhong_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern
const int_T gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern
rtInportTUtable * gblInportTUtables ; extern const char * gblInportFileName ;
extern const int_T gblNumRootInportBlks ; extern const int_T
gblNumModelInputs ; extern const int_T gblInportDataTypeIdx [ ] ; extern
const int_T gblInportDims [ ] ; extern const int_T gblInportComplex [ ] ;
extern const int_T gblInportInterpoFlag [ ] ; extern const int_T
gblInportContinuous [ ] ; extern const int_T gblParameterTuningTid ; extern
DataMapInfo * rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo *
rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid ) ; void
MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ;
void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
