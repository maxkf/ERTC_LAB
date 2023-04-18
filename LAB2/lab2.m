%clear all; clc;close all; instrreset
%data = serial_datalog('COM9',{'2*single','2*single'}, 'baudrate',115200)

subplot(2,1,1);
yyaxis left
plot(turtlebot_data.time,turtlebot_data.tilt_data(1,:));
ylim([-55 55])
ylabel("angle [deg]");

yyaxis right
plot(turtlebot_data.time,turtlebot_data.tilt_data(2,:));
ylim([-11 11])
ylabel("acceleration [m/s^2]");

xlabel("time [s]");
grid on;
legend("tilt", "acc y-axis");

subplot(2,1,2);
yyaxis left
plot(turtlebot_data.time,turtlebot_data.pan_data(1,:));
ylim([-35 35])
ylabel("angle [deg]");

yyaxis right
plot(turtlebot_data.time,turtlebot_data.pan_data(2,:));
ylim([-7 7])    
ylabel("rotational acceleration [deg/s^2]");

xlabel("time [s]");
grid on;
legend("pan", "gyro z-axis");