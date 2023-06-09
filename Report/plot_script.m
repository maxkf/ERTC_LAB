%pos = get(gcf, 'Position'); %//x left, y bottom, width, height of figure window 

close all
folder = fileparts(mfilename('fullpath'));
addpath(genpath(folder));

title("Following line one round","FontSize",17) % sets title according to selected lab data
set(gcf, 'Position',  [1412   ,      263    ,    1149     ,   1074])

tiledlayout(2,1)
PlotTitels =  ["Right Motor","Calculated Error","Left Motor"];
LegendNames = ["reference signal","encoder signal","line error","yaw error","reference signal","encoder signal"];
YLabels = ["rotational speed [rpm]","calculated error [mm]","rotational speed [rpm]"];

for a=[1,3]
    nexttile
    plot(data.time,data.out{a,1},'LineWidth',2)
    title(PlotTitels(a),"FontSize",17)
    legend(LegendNames(a*2-1),LegendNames(a*2),"FontSize",15)

    xlabel("time [s]","FontSize",15)
    ylabel(YLabels(a),"FontSize",15)

end




