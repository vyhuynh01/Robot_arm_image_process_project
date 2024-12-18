#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
#include "sm_CTarget.h"
void RobotArm_MoPhong_3ef711a9_1_setTargets ( const
RuntimeDerivedValuesBundle * rtdv , CTarget * targets ) { ( void ) rtdv ; (
void ) targets ; } void RobotArm_MoPhong_3ef711a9_1_resetAsmStateVector (
const void * mech , double * state ) { double xx [ 1 ] ; ( void ) mech ; xx [
0 ] = 0.0 ; state [ 0 ] = xx [ 0 ] ; state [ 1 ] = xx [ 0 ] ; state [ 2 ] =
xx [ 0 ] ; state [ 3 ] = xx [ 0 ] ; state [ 4 ] = xx [ 0 ] ; state [ 5 ] = xx
[ 0 ] ; } void RobotArm_MoPhong_3ef711a9_1_initializeTrackedAngleState (
const void * mech , const RuntimeDerivedValuesBundle * rtdv , const int *
modeVector , const double * motionData , double * state ) { const double *
rtdvd = rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv -> mInts .
mValues ; ( void ) mech ; ( void ) rtdvd ; ( void ) rtdvi ; ( void ) state ;
( void ) modeVector ; ( void ) motionData ; } void
RobotArm_MoPhong_3ef711a9_1_computeDiscreteState ( const void * mech , const
RuntimeDerivedValuesBundle * rtdv , double * state ) { const double * rtdvd =
rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv -> mInts . mValues ; (
void ) mech ; ( void ) rtdvd ; ( void ) rtdvi ; ( void ) state ; } void
RobotArm_MoPhong_3ef711a9_1_adjustPosition ( const void * mech , const double
* dofDeltas , double * state ) { ( void ) mech ; state [ 0 ] = state [ 0 ] +
dofDeltas [ 0 ] ; state [ 2 ] = state [ 2 ] + dofDeltas [ 1 ] ; state [ 4 ] =
state [ 4 ] + dofDeltas [ 2 ] ; } static void
perturbAsmJointPrimitiveState_0_0 ( double mag , double * state ) { state [ 0
] = state [ 0 ] + mag ; } static void perturbAsmJointPrimitiveState_0_0v (
double mag , double * state ) { state [ 0 ] = state [ 0 ] + mag ; state [ 1 ]
= state [ 1 ] - 0.875 * mag ; } static void perturbAsmJointPrimitiveState_1_0
( double mag , double * state ) { state [ 2 ] = state [ 2 ] + mag ; } static
void perturbAsmJointPrimitiveState_1_0v ( double mag , double * state ) {
state [ 2 ] = state [ 2 ] + mag ; state [ 3 ] = state [ 3 ] - 0.875 * mag ; }
static void perturbAsmJointPrimitiveState_2_0 ( double mag , double * state )
{ state [ 4 ] = state [ 4 ] + mag ; } static void
perturbAsmJointPrimitiveState_2_0v ( double mag , double * state ) { state [
4 ] = state [ 4 ] + mag ; state [ 5 ] = state [ 5 ] - 0.875 * mag ; } void
RobotArm_MoPhong_3ef711a9_1_perturbAsmJointPrimitiveState ( const void * mech
, size_t stageIdx , size_t primIdx , double mag , boolean_T doPerturbVelocity
, double * state ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; (
void ) mag ; ( void ) doPerturbVelocity ; ( void ) state ; switch ( (
stageIdx * 6 + primIdx ) * 2 + ( doPerturbVelocity ? 1 : 0 ) ) { case 0 :
perturbAsmJointPrimitiveState_0_0 ( mag , state ) ; break ; case 1 :
perturbAsmJointPrimitiveState_0_0v ( mag , state ) ; break ; case 12 :
perturbAsmJointPrimitiveState_1_0 ( mag , state ) ; break ; case 13 :
perturbAsmJointPrimitiveState_1_0v ( mag , state ) ; break ; case 24 :
perturbAsmJointPrimitiveState_2_0 ( mag , state ) ; break ; case 25 :
perturbAsmJointPrimitiveState_2_0v ( mag , state ) ; break ; } } void
RobotArm_MoPhong_3ef711a9_1_computePosDofBlendMatrix ( const void * mech ,
size_t stageIdx , size_t primIdx , const double * state , int partialType ,
double * matrix ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; (
void ) state ; ( void ) partialType ; ( void ) matrix ; switch ( ( stageIdx *
6 + primIdx ) ) { } } void
RobotArm_MoPhong_3ef711a9_1_computeVelDofBlendMatrix ( const void * mech ,
size_t stageIdx , size_t primIdx , const double * state , int partialType ,
double * matrix ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; (
void ) state ; ( void ) partialType ; ( void ) matrix ; switch ( ( stageIdx *
6 + primIdx ) ) { } } void
RobotArm_MoPhong_3ef711a9_1_projectPartiallyTargetedPos ( const void * mech ,
size_t stageIdx , size_t primIdx , const double * origState , int partialType
, double * state ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; (
void ) origState ; ( void ) partialType ; ( void ) state ; switch ( (
stageIdx * 6 + primIdx ) ) { } } void
RobotArm_MoPhong_3ef711a9_1_propagateMotion ( const void * mech , const
RuntimeDerivedValuesBundle * rtdv , const double * state , double *
motionData ) { const double * rtdvd = rtdv -> mDoubles . mValues ; const int
* rtdvi = rtdv -> mInts . mValues ; double xx [ 49 ] ; ( void ) mech ; ( void
) rtdvd ; ( void ) rtdvi ; xx [ 0 ] = - 0.4699176591060731 ; xx [ 1 ] =
0.5274689008567295 ; xx [ 2 ] = - 0.4722977219699024 ; xx [ 3 ] =
0.5271516044851832 ; xx [ 4 ] = 0.5 ; xx [ 5 ] = xx [ 4 ] * state [ 0 ] ; xx
[ 6 ] = 0.112230074986867 ; xx [ 7 ] = sin ( xx [ 5 ] ) ; xx [ 8 ] =
0.9936789061459573 ; xx [ 9 ] = 2.577159097930992e-3 ; xx [ 10 ] = cos ( xx [
5 ] ) ; xx [ 11 ] = - ( xx [ 6 ] * xx [ 7 ] ) ; xx [ 12 ] = xx [ 8 ] * xx [ 7
] ; xx [ 13 ] = xx [ 9 ] * xx [ 7 ] ; pm_math_Quaternion_compose_ra ( xx + 0
, xx + 10 , xx + 14 ) ; xx [ 0 ] = - 3.63728915697099e-3 ; xx [ 1 ] =
0.0402537649539307 ; xx [ 2 ] = 2.023788572142841e-4 ;
pm_math_Quaternion_xform_ra ( xx + 14 , xx + 0 , xx + 10 ) ; xx [ 0 ] = -
0.9992054213361293 ; xx [ 1 ] = - 1.742727105171529e-3 ; xx [ 2 ] =
9.938293481809883e-3 ; xx [ 3 ] = - 0.03855799783954649 ; xx [ 5 ] = xx [ 4 ]
* state [ 2 ] ; xx [ 7 ] = 0.01787686434702147 ; xx [ 13 ] = sin ( xx [ 5 ] )
; xx [ 18 ] = 6.269173129997617e-5 ; xx [ 19 ] = 0.999840194126474 ; xx [ 20
] = cos ( xx [ 5 ] ) ; xx [ 21 ] = xx [ 7 ] * xx [ 13 ] ; xx [ 22 ] = xx [ 18
] * xx [ 13 ] ; xx [ 23 ] = xx [ 19 ] * xx [ 13 ] ;
pm_math_Quaternion_compose_ra ( xx + 0 , xx + 20 , xx + 24 ) ; xx [ 0 ] = -
0.1230788393059628 ; xx [ 1 ] = - 0.1319905667835067 ; xx [ 2 ] = -
0.1016345907569572 ; pm_math_Quaternion_xform_ra ( xx + 24 , xx + 0 , xx + 20
) ; xx [ 0 ] = 4.818499673787823e-3 - xx [ 20 ] ; xx [ 1 ] = - (
0.0350267134375402 + xx [ 21 ] ) ; xx [ 2 ] = 0.02100716222249827 - xx [ 22 ]
; xx [ 20 ] = - 0.9976603036735752 ; xx [ 21 ] = 0.06098137289961789 ; xx [
22 ] = - 8.849647787716972e-3 ; xx [ 23 ] = 0.02961206455587039 ; xx [ 3 ] =
xx [ 4 ] * state [ 4 ] ; xx [ 4 ] = 3.794869666357719e-3 ; xx [ 5 ] = sin (
xx [ 3 ] ) ; xx [ 13 ] = 0.1210828890578584 ; xx [ 28 ] = 0.9926351459330954
; xx [ 29 ] = cos ( xx [ 3 ] ) ; xx [ 30 ] = xx [ 4 ] * xx [ 5 ] ; xx [ 31 ]
= - ( xx [ 13 ] * xx [ 5 ] ) ; xx [ 32 ] = xx [ 28 ] * xx [ 5 ] ;
pm_math_Quaternion_compose_ra ( xx + 20 , xx + 29 , xx + 33 ) ; xx [ 20 ] =
0.0171853084098464 ; xx [ 21 ] = 0.06289756339718786 ; xx [ 22 ] = -
0.05310311455470163 ; pm_math_Quaternion_xform_ra ( xx + 33 , xx + 20 , xx +
29 ) ; xx [ 3 ] = 0.01622874380105694 - xx [ 29 ] ; xx [ 5 ] = - (
0.1320517857770284 + xx [ 30 ] ) ; xx [ 20 ] = - ( 0.141631382387808 + xx [
31 ] ) ; xx [ 21 ] = - ( xx [ 6 ] * state [ 1 ] ) ; xx [ 6 ] = xx [ 8 ] *
state [ 1 ] ; xx [ 8 ] = xx [ 9 ] * state [ 1 ] ; xx [ 9 ] =
9.735924488676052e-5 * state [ 1 ] ; xx [ 22 ] = 1.333912147822202e-5 * state
[ 1 ] ; xx [ 23 ] = 9.033855484478766e-4 * state [ 1 ] ; xx [ 29 ] = xx [ 21
] ; xx [ 30 ] = xx [ 6 ] ; xx [ 31 ] = xx [ 8 ] ;
pm_math_Quaternion_inverseXform_ra ( xx + 24 , xx + 29 , xx + 37 ) ; xx [ 32
] = xx [ 37 ] + xx [ 7 ] * state [ 3 ] ; xx [ 7 ] = xx [ 38 ] + xx [ 18 ] *
state [ 3 ] ; xx [ 18 ] = xx [ 39 ] + xx [ 19 ] * state [ 3 ] ;
pm_math_Vector3_cross_ra ( xx + 29 , xx + 0 , xx + 37 ) ; xx [ 29 ] = xx [ 37
] - xx [ 9 ] ; xx [ 30 ] = xx [ 38 ] - xx [ 22 ] ; xx [ 31 ] = xx [ 39 ] + xx
[ 23 ] ; pm_math_Quaternion_inverseXform_ra ( xx + 24 , xx + 29 , xx + 37 ) ;
xx [ 19 ] = xx [ 37 ] - 0.1319631022672302 * state [ 3 ] ; xx [ 29 ] = xx [
38 ] + 0.1212422627926077 * state [ 3 ] ; xx [ 30 ] = xx [ 39 ] +
2.351861431952746e-3 * state [ 3 ] ; xx [ 37 ] = xx [ 32 ] ; xx [ 38 ] = xx [
7 ] ; xx [ 39 ] = xx [ 18 ] ; pm_math_Quaternion_inverseXform_ra ( xx + 33 ,
xx + 37 , xx + 40 ) ; xx [ 43 ] = xx [ 3 ] ; xx [ 44 ] = xx [ 5 ] ; xx [ 45 ]
= xx [ 20 ] ; pm_math_Vector3_cross_ra ( xx + 37 , xx + 43 , xx + 46 ) ; xx [
37 ] = xx [ 46 ] + xx [ 19 ] ; xx [ 38 ] = xx [ 47 ] + xx [ 29 ] ; xx [ 39 ]
= xx [ 48 ] + xx [ 30 ] ; pm_math_Quaternion_inverseXform_ra ( xx + 33 , xx +
37 , xx + 43 ) ; motionData [ 0 ] = xx [ 14 ] ; motionData [ 1 ] = xx [ 15 ]
; motionData [ 2 ] = xx [ 16 ] ; motionData [ 3 ] = xx [ 17 ] ; motionData [
4 ] = 2.834533779306023e-3 - xx [ 10 ] ; motionData [ 5 ] = - xx [ 11 ] ;
motionData [ 6 ] = 0.05450000000000001 - xx [ 12 ] ; motionData [ 7 ] = xx [
24 ] ; motionData [ 8 ] = xx [ 25 ] ; motionData [ 9 ] = xx [ 26 ] ;
motionData [ 10 ] = xx [ 27 ] ; motionData [ 11 ] = xx [ 0 ] ; motionData [
12 ] = xx [ 1 ] ; motionData [ 13 ] = xx [ 2 ] ; motionData [ 14 ] = xx [ 33
] ; motionData [ 15 ] = xx [ 34 ] ; motionData [ 16 ] = xx [ 35 ] ;
motionData [ 17 ] = xx [ 36 ] ; motionData [ 18 ] = xx [ 3 ] ; motionData [
19 ] = xx [ 5 ] ; motionData [ 20 ] = xx [ 20 ] ; motionData [ 21 ] = xx [ 21
] ; motionData [ 22 ] = xx [ 6 ] ; motionData [ 23 ] = xx [ 8 ] ; motionData
[ 24 ] = - xx [ 9 ] ; motionData [ 25 ] = - xx [ 22 ] ; motionData [ 26 ] =
xx [ 23 ] ; motionData [ 27 ] = xx [ 32 ] ; motionData [ 28 ] = xx [ 7 ] ;
motionData [ 29 ] = xx [ 18 ] ; motionData [ 30 ] = xx [ 19 ] ; motionData [
31 ] = xx [ 29 ] ; motionData [ 32 ] = xx [ 30 ] ; motionData [ 33 ] = xx [
40 ] + xx [ 4 ] * state [ 5 ] ; motionData [ 34 ] = xx [ 41 ] - xx [ 13 ] *
state [ 5 ] ; motionData [ 35 ] = xx [ 42 ] + xx [ 28 ] * state [ 5 ] ;
motionData [ 36 ] = xx [ 43 ] + 0.05600445349335 * state [ 5 ] ; motionData [
37 ] = xx [ 44 ] - 0.01726026051992588 * state [ 5 ] ; motionData [ 38 ] = xx
[ 45 ] - 2.319534847038312e-3 * state [ 5 ] ; } size_t
RobotArm_MoPhong_3ef711a9_1_computeAssemblyError ( const void * mech , const
RuntimeDerivedValuesBundle * rtdv , size_t constraintIdx , const int *
modeVector , const double * motionData , double * error ) { ( void ) mech ; (
void ) rtdv ; ( void ) modeVector ; ( void ) motionData ; ( void ) error ;
switch ( constraintIdx ) { } return 0 ; } size_t
RobotArm_MoPhong_3ef711a9_1_computeAssemblyJacobian ( const void * mech ,
const RuntimeDerivedValuesBundle * rtdv , size_t constraintIdx , boolean_T
forVelocitySatisfaction , const double * state , const int * modeVector ,
const double * motionData , double * J ) { ( void ) mech ; ( void ) rtdv ; (
void ) state ; ( void ) modeVector ; ( void ) forVelocitySatisfaction ; (
void ) motionData ; ( void ) J ; switch ( constraintIdx ) { } return 0 ; }
size_t RobotArm_MoPhong_3ef711a9_1_computeFullAssemblyJacobian ( const void *
mech , const RuntimeDerivedValuesBundle * rtdv , const double * state , const
int * modeVector , const double * motionData , double * J ) { const double *
rtdvd = rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv -> mInts .
mValues ; ( void ) mech ; ( void ) rtdvd ; ( void ) rtdvi ; ( void ) state ;
( void ) modeVector ; ( void ) motionData ; ( void ) J ; return 0 ; }
boolean_T RobotArm_MoPhong_3ef711a9_1_isInKinematicSingularity ( const void *
mech , const RuntimeDerivedValuesBundle * rtdv , size_t constraintIdx , const
int * modeVector , const double * motionData ) { ( void ) mech ; ( void )
rtdv ; ( void ) modeVector ; ( void ) motionData ; switch ( constraintIdx ) {
} return 0 ; } void RobotArm_MoPhong_3ef711a9_1_convertStateVector ( const
void * asmMech , const RuntimeDerivedValuesBundle * rtdv , const void *
simMech , const double * asmState , const int * asmModeVector , const int *
simModeVector , double * simState ) { const double * rtdvd = rtdv -> mDoubles
. mValues ; const int * rtdvi = rtdv -> mInts . mValues ; ( void ) asmMech ;
( void ) rtdvd ; ( void ) rtdvi ; ( void ) simMech ; ( void ) asmModeVector ;
( void ) simModeVector ; simState [ 0 ] = asmState [ 0 ] ; simState [ 1 ] =
asmState [ 1 ] ; simState [ 2 ] = asmState [ 2 ] ; simState [ 3 ] = asmState
[ 3 ] ; simState [ 4 ] = asmState [ 4 ] ; simState [ 5 ] = asmState [ 5 ] ; }
