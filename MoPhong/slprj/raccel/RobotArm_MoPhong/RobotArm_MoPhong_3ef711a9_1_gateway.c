#ifdef MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
#include "rtwtypes.h"
#endif
#include "nesl_rtw.h"
#include "RobotArm_MoPhong_3ef711a9_1.h"
#include "RobotArm_MoPhong_3ef711a9_1_gateway.h"
void RobotArm_MoPhong_3ef711a9_1_gateway ( void ) { NeModelParameters
modelparams = { ( NeSolverType ) 0 , 0.001 , 0.001 , 0.001 , 1 , 0 , (
NeModifyAbsTol ) 2 , 0.001 , 0 , 0 , 0 , 0 , ( SscLoggingSetting ) 0 ,
619714283 , 0 , } ; NeSolverParameters solverparams = { 0 , 0 , 1 , 0 , 0 ,
0.001 , 0.001 , 1e-09 , 0 , 0 , 100 , 0 , 1 , ( NeIndexReductionMethod ) 1 ,
0 , 1e-09 , 0 , ( NeLocalSolverChoice ) 0 , 0.001 , 0 , 3 , 2 , 0 , 2 , (
NeLinearAlgebraChoice ) 0 , 0 , ( NeEquationFormulationChoice ) 0 , 1024 , 1
, 0.001 , ( NePartitionStorageMethod ) 0 , 1024 , ( NePartitionMethod ) 0 , }
; const NeOutputParameters * outputparameters = NULL ; NeDae * dae ; size_t
numOutputs = 0 ; int * rtpDaes = NULL ; int rtwLogDaes [ 1 ] = { 0 } ;
RobotArm_MoPhong_3ef711a9_1_dae ( & dae , & modelparams , & solverparams ) ;
nesl_register_simulator_group ( "RobotArm_MoPhong/Solver Configuration_1" , 1
, & dae , & solverparams , & modelparams , numOutputs , outputparameters , 0
, rtpDaes , 1 , rtwLogDaes ) ; }
