
%clear all; clc;close all; instrreset


%data = serial_datalog('COM9',{'2*single','2*single'}, 'baudrate',115200)
subplot(2,1,1);
plot(turtlebot_data.time,turtlebot_data.tilt_data);
grid on;
xlabel("time (s)");
ylabel("acceleration/angle");
legend("tilt (deg)", "a-y (m/s^2)");

subplot(2,1,2);
plot(turtlebot_data.time,turtlebot_data.pan_data);
grid on;
ylabel("acceleration/angle");
legend("pan (deg)", "g-z (deg/s^2)");