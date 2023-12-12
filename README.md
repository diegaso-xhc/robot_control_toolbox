# Robot Control Toolbox

## Overview of the repository

<div align="justify">
Human hands are the sought-after end effector, because of their high performance and remarkable flexibility. Emulating and embedding human hand capabilities into robotic grasping is crucial to further advance the object manipulation field. State-of-the-art robot hands allow the exertion of grasps which can be leveraged to accomplish complex tasks (e.g. in hand manipulation scenarios). Among these state-of-the-art robotic hands is the <a href="https://www.prensilia.com/ih2-azzurra-hand/">ih2 azzurra hand</a> developed by <a href="https://www.prensilia.com/">Prensilia</a>. This hand offers 5 degrees of actuation with 11 degrees of freedom. Additionally, the hand allows position, current, velocity, and force control on its fringers. Since interacting with this robotic hand is not intuitive at first, this repository provides some ready to use functionalities that can be used to build more complex actions.   
<br />
<br /> 
<p align="center">
   <img src="/Visualizations/Impedance_opt.gif" width="700" />
</p>


## Understanding repository

The reository contains two files, namely:
```
- toolkits: Python file containing all classes and controllers to connect, use, and control the robotic hand.
- main: A main file containing samples on how to use the functions on toolkits.
```
The classes are written in a way that facilitates the connection with the hand. The repository also reduces the complexity of handling bytes transmission from and to the hand. This allows the user to focus directly on high level controllers and experiment within different applications.
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
   <img src="/Visualizations/Sine_response.PNG" width="650" />
</p>

### Time response to a Step-like excitement signal

The following figure shows the time response of a system to a step-like excitement signal:

<p align="center">
  <img src="/Visualizations/Systems_time_response.PNG" width="650" />  
</p>

## License

Developed by Diego Hidalgo C. (2021). This repository is intended for research purposes only. If you wish to use any parts of the provided code for commercial purposes, please contact the author at hidalgocdiego@gmail.com.

