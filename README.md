# Robot Control Toolbox

## Overview of the repository

<div align="justify">
The progressive prevalence of robotic systems in a myriad of applications worldwide makes robotics one of the disciplines to keep an eye on in the upcoming years. Although the knowledge for robotic modeling and control is highly developed, there are not many intuitive and easy to use platforms for putting theoretical knowledge in practice with arbitrary systems. In this repository, we aim to providing a framework in which easily generalizable algorithms for robotic modeling and control can be analyzed and deployed. This repository has a focus on a 2DOF robot in a configuration similar to a double pendulum. Nevertheless, the code is structured in a way that can easily be scaled to different robotic configurations. The visualization is tailored for a double pendulum though. The control algorithms are based on screw theory and uses algorithms proposed and provided in the <a href="https://hades.mech.northwestern.edu/index.php/Modern_Robotics#Book)/">Modern Robotics book</a> by Kevin M. Lynch, Frank Chongwoo Park.

<br />
<br /> 
<p align="center">
   <img src="/Visualizations/impedance.gif" width="700" />
</p>

## Understanding repository

The repository contains the following files:
```
- ControlSerialMultiDOF: A class for the control of a serial multi degree of freedom chain.
- main: A main file containing samples on how to use the aforementioned class.
- Call back functions: Functions that allow the reading of position and events of the mouse on the screen (useful for interaction with the robot in torque control mode)
- mr: The functions provided by Modern Robotics open source repository (https://www.google.com/search?channel=fs&client=ubuntu&q=modern+robotics+repository)
```

The class is written in a way that facilitates the control of any serial robot. Within each type of controller there are commented lines which can be tested depending on the user functionality. Some of these functionalities include for instance gravity compensation, PID + dynamics, PID control, among others.

<br />
Whenever using torque control, you will be able to add external forces to the end effector by clicking in the screen and dragging the mouse. Forces are expressed on the end effector's frame. For isntance, if you drag the mouse to the right of the screen a positive force on the X axis of the end effector's frame will be applied. External forces values are visualized within the screen for a better understanding.
<br />


### Position error vs. Time

<br />

## Contributions

The contributions of this repository can be summarized as follows:

```
- A class that facilitates the understanding of the control of serial robots.
- A visualization tool tailored for controllers on a double pendulum (easily customizable to others).
- Ready to use controllers for position using velocity and torque as control variables.
- An interactive tool for understanding of impedance control.
```

## Examples of toolbox

### Cartesian velocity control

The following figure shows an example of a cartesian velocity control, where the robot tracks desired SE3 matrices. To run this command simply uncomment the required line at the end of the main.m file.

<p align="center">
   <img src="/Visualizations/Velocity.gif" width="750" />
</p>

### Joint torque control

The following figure shows an example of a cartesian velocity control, where the robot tracks desired SE3 matrices. To run this command simply uncomment the required line at the end of the main.m file.

<p align="center">
   <img src="/Visualizations/Velocity.gif" width="750" />
</p>


<p align="center">
   <img src="/Visualizations/Cartesian_velocity_control.png" width="650" />
</p>

<p align="center">
   <img src="/Visualizations/Joint_torque_control.png" width="650" />
</p>



<p align="center">
   <img src="/Visualizations/Cartesian_torque_control.png" width="650" />
</p>

<p align="center">
   <img src="/Visualizations/Cartesian_impedance_control.png" width="650" />
</p>
### Time response to a Step-like excitement signal

The following figure shows the time response of a system to a step-like excitement signal:

<p align="center">
  <img src="/Visualizations/Systems_time_response.PNG" width="650" />  
</p>

## License

Developed by Diego Hidalgo C. (2021). This repository is intended for research purposes only. If you wish to use any parts of the provided code for commercial purposes, please contact the author at hidalgocdiego@gmail.com.

