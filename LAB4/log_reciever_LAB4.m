clear all; clc;close all; instrreset;
%data = serial_datalog('COM9',{'2*single','2*single'}, 'baudrate',115200);
data = udp_datalog('147.162.118.150',9090, {'2*single','2*single','2*single'},'buffersize', 100000)

% plot(data.time,data.out{1} )
% figure
% plot(data.time,data.out{2} )
% figure
% plot(data.time,data.out{3} )