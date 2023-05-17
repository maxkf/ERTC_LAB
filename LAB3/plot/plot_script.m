load out_data.mat

plot(turtlebot_data.time,turtlebot_data.Motor_1)
hold on 
plot(turtlebot_data.time,turtlebot_data.Motor_2)
plot(turtlebot_data.time,turtlebot_data.controller_1_data)
plot(turtlebot_data.time,turtlebot_data.controller_2_data)
hold off