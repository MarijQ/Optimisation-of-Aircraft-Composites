close all; clear; clc

plot_shape(40,15,15,40,2.208)

function plot_shape(A,B,C,D,T)
    %% Generate array of points
    points = zeros(15,2);
    points(1,:)=[1,2];
    
    disp(points)
    %% Plot figure
    figure()
    hold on
    plot(points(:,1),points(:,2),'bx-')
end