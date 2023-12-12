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
Whenever using position, current or force controllers, you will be able to see and extract the error and response on each one of the fingers you desired to control. The following images correspond to the position error and response signals of the motion on the gif above:
<br />


### Position error vs. Time
<p align="center">
   <img src="/Visualizations/Velocity.gif" width="750" />
</p>
<br />

## Contributions

The contributions of this repository can be summarized as follows:

```
- A class that facilitates the connection via serial port to a device.
- Classes that handle the byte transmission to and from the robotic hand.
- Most of the functionalities explained in the manual of the ih2 azzurra hand (you won't need to develop things on your own).
- Ready to use controllers for position, current and force (P,PI,PD,PID).
- Visualization functions for analysis of the controllers responses.
```

## Examples of GUI usage

### Time response to a Sine-wave-like excitement signal

The following figure shows the time response of a system to a sine wave excitement signal of 4Hz. Note that in order to obtain the time response, the user needs to do the following:

```
- Input the transfer function: [numerator separated by commas];[denominator separated by commas]
- Click on Create Model
- Input the sampling time (dt), initial time (t(t0)), and final time in seconds.
- If the user requires a step response, click on Step response. For sine wave excitements, please input the frequency of the sine wave and click on Sine response.
- The user can then click on get time response or view frequency spectrum.
- Although visualizations for Bode and Nichols charts are not available at the moment, the user can still click them and extract the frequency responses from the library.
```

<p align="center">
   <img src="/Visualizations/Joint_torque_control.png" width="650" />
</p>

<p align="center">
   <img src="/Visualizations/Cartesian_velocity_control.png" width="650" />
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

