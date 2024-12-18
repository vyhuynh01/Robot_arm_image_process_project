% Simscape(TM) Multibody(TM) version: 7.5

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(8).translation = [0.0 0.0 0.0];
smiData.RigidTransform(8).angle = 0.0;
smiData.RigidTransform(8).axis = [0.0 0.0 0.0];
smiData.RigidTransform(8).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 -15.249997377395619];  % mm
smiData.RigidTransform(1).angle = 1.224646799147353e-16;  % rad
smiData.RigidTransform(1).axis = [-0 -1 0];
smiData.RigidTransform(1).ID = "B[Link1-1:-:Link2-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-139.98163486647425 2.2678322524298924 -15.999979805196343];  % mm
smiData.RigidTransform(2).angle = 4.3140281445068459e-15;  % rad
smiData.RigidTransform(2).axis = [-0.57863557208851135 -0.81558621537750464 1.0179536035466635e-15];
smiData.RigidTransform(2).ID = "F[Link1-1:-:Link2-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [1.0804447614365387e-09 -7.294720383299591e-10 21];  % mm
smiData.RigidTransform(3).angle = 3.4914813388431349e-15;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = "B[Belt-1:-:Link1-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-139.91103693426476 4.9999970061789369 22.250023603439388];  % mm
smiData.RigidTransform(4).angle = 3.5108334685767017e-16;  % rad
smiData.RigidTransform(4).axis = [0.99344268924297285 -0.1143311995462737 -1.9938285587276632e-17];
smiData.RigidTransform(4).ID = "F[Belt-1:-:Link1-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [2.8345337793060228 -1.3270634591222574e-13 54.500000000000007];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [1 0 0];
smiData.RigidTransform(5).ID = "B[Base-1:-:Belt-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-3.8382919560930873e-05 75.699999999270631 4.7030002576775587e-06];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931935;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918962506 -0.57735026918962506 -0.57735026918962717];
smiData.RigidTransform(6).ID = "F[Base-1:-:Belt-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 0 0];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = "B[Base-1:-:]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [0 0 0];  % mm
smiData.RigidTransform(8).angle = 0;  % rad
smiData.RigidTransform(8).axis = [0 0 0];
smiData.RigidTransform(8).ID = "F[Base-1:-:]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.23784393714085514;  % kg
smiData.Solid(1).CoM = [-0.90364194507962392 35.291948074243429 -0.096238771183062774];  % mm
smiData.Solid(1).MoI = [464.01542004376944 392.37091896015733 156.91172224151296];  % kg*mm^2
smiData.Solid(1).PoI = [-0.58870102887105669 -0.65792118886242656 -8.1976493176549479];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Belt*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.16661807179544755;  % kg
smiData.Solid(2).CoM = [-10.411332435318165 -0.49878484329605427 27.013301302639576];  % mm
smiData.Solid(2).MoI = [120.84595553194337 171.68575723285278 206.79992797245174];  % kg*mm^2
smiData.Solid(2).PoI = [1.9513150317197783 -7.399447003027535 -1.724309152533626];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Base*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.046891648054801137;  % kg
smiData.Solid(3).CoM = [-14.086071561429852 132.62270653776343 126.07691098724874];  % mm
smiData.Solid(3).MoI = [4.6991693574726439 116.91716351456857 115.95712291017041];  % kg*mm^2
smiData.Solid(3).PoI = [0.070388743132106926 -1.9911601541015149 3.9681601480879722];  % kg*mm^2
smiData.Solid(3).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Link1*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.10830922489619581;  % kg
smiData.Solid(4).CoM = [-162.65691825155039 -51.821234753921985 44.262640745551636];  % mm
smiData.Solid(4).MoI = [32.017962166665058 489.00231500366169 489.50901703975552];  % kg*mm^2
smiData.Solid(4).PoI = [-0.29135863659084033 -1.7881514404930183 44.183867140457075];  % kg*mm^2
smiData.Solid(4).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "Link2*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(3).Rz.Pos = 0.0;
smiData.RevoluteJoint(3).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 114.9281630146904;  % deg
smiData.RevoluteJoint(1).ID = "[Link1-1:-:Link2-1]";

smiData.RevoluteJoint(2).Rz.Pos = -130.00000000000051;  % deg
smiData.RevoluteJoint(2).ID = "[Belt-1:-:Link1-1]";

smiData.RevoluteJoint(3).Rz.Pos = -89.999999999999986;  % deg
smiData.RevoluteJoint(3).ID = "[Base-1:-:Belt-1]";

