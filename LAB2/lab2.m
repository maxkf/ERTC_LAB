
clear all; clc;close all; instrreset


data = serial_datalog('COM7',{'2*single','2*single'}, 'baudrate',115200)