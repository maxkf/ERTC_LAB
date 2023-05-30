clear all; clc;close all; instrreset;
%data = serial_datalog('COM9',{'2*single','2*single'}, 'baudrate',115200);

data = udp_datalog('147.162.118.149',9090, {'2*single','2*single','2*single'})

% plot(data.time,data.out{1} )
% 
% plot(data.time,data.out{2} )