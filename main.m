clear all
close all
clc

addpath('./mr') % Include functions from modern robotics book 

%%%% Simulation
cartesian_poses = {};
cartesian_poses{1} = [0.707 -0.707 0 1.4142;0.707 0.707 0 1.4142;0 0 1 0;0 0 0 1];
cartesian_poses{2} = [-1 0 0 -0.5;0 -1 0 0.85;0 0 1 0;0 0 0 1];
cartesian_poses{3} = [0 1 0 1;-1 0 0 -1;0 0 1 0;0 0 0 1];
cartesian_poses{4} = [1 0 0 1;0 1 0 -1;0 0 1 0;0 0 0 1];
cartesian_poses{5} = [1 0 0 0.5;0 1 0 0.85;0 0 1 0;0 0 0 1];
cartesian_poses{6} = [0 -1 0 -1;1 0 0 1;0 0 1 0;0 0 0 1];
cartesian_poses{7} = [-0.707 -0.707 0 -1.4142;0.707 -0.707 0 1.4142;0 0 1 0;0 0 0 1];

joint_poses = {};
joint_poses{1} = [pi/4, pi/4];
joint_poses{2} = [pi/2, pi/4];
joint_poses{3} = [0, 0];
joint_poses{4} = [pi, -pi/2];
joint_poses{5} = [3*pi/2, -pi/2];
joint_poses{6} = [-pi/2, pi/2];
joint_poses{7} = [pi/4, 0];

%%%% Goal states
goal_poses.cartesian_poses = cartesian_poses;
goal_poses.joint_poses = joint_poses;
%%%%

%%%% Properties of the system (valid for only a double pendulum)
syst.l1 = 1; % Length of link 1
syst.l2 = 1; % Length of link 2
syst.Slist_home = [0 0;0 0;1 1;0 0;0 -syst.l1;0 0]; % Screw axes at home position
syst.Msb_home = [1 0 0 syst.l1+syst.l2;0 1 0 0;0 0 1 0;0 0 0 1]; % Transformation base to EE at home position
syst.thetalist = [rand rand]'; % Initial joint positions
syst.m1 = 1; % Mass of link 1
syst.m2 = 1; % Mass of link 2
M01 = [1 0 0 syst.l1/2;0 1 0 0;0 0 1 0;0 0 0 1]; % Transformation from base to COM of link 1
M12 = [1 0 0 syst.l1/2+syst.l2/2;0 1 0 0;0 0 1 0;0 0 0 1]; % Transformation from base to COM of link 2
M23 = [1 0 0 syst.l2/2;0 1 0 0;0 0 1 0;0 0 0 1]; % Transformation from COM of link 2 to EE
syst.Mlist_home = cat(3, M01, M12, M23);
syst.b = 0.1; % Damping due to joints bearings, etc.
%%%%

%%%% Impedance controller parameters
imp_ctrl.K_imp = [0.1,0.1,5,5,5,0.1]'; % Stiffness coefficients
imp_ctrl.B_imp = [0.1,0.1,0.1,0.1,0.1,0.1]'; % Damping coefficients
%%%%

%%%% Type of control
p.control = "cartesian_torque"; % Type of control
gains = 200*[0.1,0.1,0.1,0.1,0.1,0.1]; % Gains for velocity control
ths = 0.03; % Position error threshold
dt = 0.001; % Sampling time
type = 'Body_jacobian'; % Type of jacobian to be used (for velocity control)
%%%%

f = figure;
set(f,'WindowButtonMotionFcn','','WindowButtonDownFcn',@ClickDown,'WindowButtonUpFcn',@ClickUp,'KeyPressFc',@KeyPress); % Callbacks for clicking and dragging the mouse (for scaling external forces)

%%%% Data from the plot
figData.xtarget = [];
figData.ytarget = [];
figData.Fx = [];
figData.Fy = [];
figData.xend = [];
figData.yend = [];
figData.fig = f;
figData.tarControl = false;
figData.simArea = subplot(1,1,1); 
%%%%

%%%% Specifications for the plot
set(f, 'position', [50, 50, 1500, 1000]) % Positioning of the plot and dimensions
hold on
set(f, 'UserData', figData);
set(gcf,'color',[0 0 0]); % Background
axis([-3*syst.l1 3*syst.l1 -3*syst.l2 3*syst.l2]);
pbaspect([1 1 1]);
axis('off')
%%%%

%%%% Required plots for double pendulum
h = {};
h{1} = plot(NaN,NaN,'Color',[128,128,0]/255,'LineWidth',8); % First link anchor
h{2} = plot(NaN,NaN,'.','Color',[24, 111, 101]/255, 'MarkerSize',60); 
h{3} = plot(NaN,NaN,'Color',[24, 111, 101]/255,'LineWidth',8); 
h{4} = plot(NaN,NaN,'.','Color',[150,150,150]/255,'MarkerSize',50); 
h{5} = plot(NaN,NaN,'.','Color',[128,128,0]/255,'MarkerSize',70); 
h{6} = quiver(NaN,NaN,NaN,NaN,'b','LineWidth',2);
h{7} = quiver(NaN,NaN,NaN,NaN,'r','LineWidth',2);
h{8} = plot(NaN,NaN,'xr','MarkerSize',20,'LineWidth',3);
%%%%

control_double_pendulum = ControlSerialMultiDOF(goal_poses, syst, h, f); % Initiallize a controller for the double pendulum
% control_double_pendulum.run_cartesian_velocity_controller(gains, ths, type, dt)
% control_double_pendulum.run_joint_torque_controller(ths, dt);
% control_double_pendulum.run_cartesian_torque_controller(ths,dt);
control_double_pendulum.run_cartesian_impedance_controller(imp_ctrl, ths, dt)