close all; clear; clc
global data

%% Read Data
load('method_results_data.mat')

%% Master Run Command

% plot_unconstrained()
% plot_constrained()
% plot_weights()
plot_shapes_un()
% plot_shapes_con()

%% Functions

function plot_unconstrained()
    global data
    colors=[[0.5 0.5 0.5];[0.8500 0.3250 0.0980];[0 0.4470 0.7410];[0.4940 0.1840 0.5560];[0.4660 0.6740 0.1880]];
%     style=['-',':','-','-','-'];
    
    figure()
    hold on
    for i = 1:5
        x = [40:.1:80];
        curve = normpdf(x,data(i,6),data(i,7));
        plot(x,curve,'linewidth',2,'Color',colors(i,:));
        plot([data(i,8),data(i,8)],[0,0.25],'--','Color',colors(i,:),'linewidth',2,'HandleVisibility','off')
    end
    legend('Base Design','Deterministic','Robust','Reliable','Robust+Reliable');
    plot_config('Buckling Load (kN)','Probability Density',[],[],[])
end

function plot_constrained()
    global data
    colors=[[0.5 0.5 0.5];[0.8500 0.3250 0.0980];[0 0.4470 0.7410];[0.4940 0.1840 0.5560];[0.4660 0.6740 0.1880]];
%     style=['-',':','-','-','-'];
    
    figure()
    hold on
    for i = [8,9,10,12]
        x = [45:.1:80];
        curve = normpdf(x,data(i,6)/data(i,5),data(i,7)/data(i,5));
        plot(x,curve,'linewidth',2,'Color',colors(i-7,:));
        plot([data(i,8)/data(i,5),data(i,8)/data(i,5)],[0,0.25],'--','Color',colors(i-7,:),'linewidth',2,'HandleVisibility','off')
    end
    legend('Base Design','Deterministic/Reliable','Robust','Robust+Reliable');
    plot_config('Load per kg (kN)','Probability Density',[],[],[])
end

function plot_weights()
    global data
    colors=[[0 0.4470 0.7410];[0.4940 0.1840 0.5560];[0.4660 0.6740 0.1880];[0.5 0.5 0.5];[0.8500 0.3250 0.0980]];
    style=['-','-','-',':',':'];
    
    figure()
    hold on
    for i = 3:7
        x = [40:.1:80];
        curve = normpdf(x,data(i,6),data(i,7));
        plot(x,curve,'linewidth',2,'Color',colors(i-2,:));
        plot([data(i,8),data(i,8)],[0,0.25],'--','Color',colors(i-2,:),'linewidth',2,'HandleVisibility','off')
        linefunc = @(x) -91/35500*x+28883/88750;
    end
    plot(x,linefunc(x),'k','LineWidth',2)
    legend('Robust','Reliable','Hybrid 1:1','Hybrid 2:1','Hybrid 1:2','Interpolation Line');
    plot_config('Buckling Load (kN)','Probability Density',[],[],[])
end

function plot_shape(A,B,C,D,T,j)
    %% Generate array of points
    colors=[[0.5 0.5 0.5];[0.4940 0.1840 0.5560];[0 0.4470 0.7410];[0.8500 0.3250 0.0980];[0.4660 0.6740 0.1880]];
    
    points = zeros(15,2);
    inc=T*(-B+sqrt(B^2+D^2))/(2*D);
    points(1,:)=[0,D+T];
    points(2,:)=[C+inc,D+T];
    points(3,:)=[B+C+inc,T];
    points(4,:)=[A+B+C,T];
    points(5,:)=[A+B+C,0];
    points(6,:)=[B+C-inc,0];
    points(7,:)=[C-inc,D];
    points(8,:)=[0,D];
    for i=9:15
        points(i,1)=-points(16-i,1);
        points(i,2)=points(16-i,2);
    end
%     raw=[0,D+T/2;C,D+T/2;B+C,T/2;A+B+C,T/2];
    disp(i)
    if j==10
        fill(points(:,1),points(:,2)+30*(j-6-1),colors(j-5,:),'LineWidth',2)
    elseif j>5
        fill(points(:,1),points(:,2)+30*(j-5-1),colors(j-5,:),'LineWidth',2)
    else
        fill(points(:,1),points(:,2)+30*(j-1),colors(j,:),'LineWidth',2)
    end
%     plot(points(:,1),points(:,2),'LineWidth',2,'Color',colors(j,:))
%     plot(raw(:,1),raw(:,2),'kx-')
    
end

function plot_shapes_un()
    global data

    figure('Position', [50 200 800 700])
    hold on
    axis off
    xlim([-76,76]),ylim([0,150])
    for i=1:5
        plot_shape(data(i,1),data(i,2),data(i,3),data(i,4),2.208,i)
    end
    legend('Base Design','Deterministic','Robust','Reliable','Robust+Reliable')
end

function plot_shapes_con()
    global data

    figure('Position', [50 200 800 600])
    hold on
    axis off
    xlim([-76,76]),ylim([0,120])
    for i=[6,7,8,10]
        plot_shape(data(i,1),data(i,2),data(i,3),data(i,4),2.208,i)
    end
    legend('Base Design','Deterministic/Reliable','Robust','Robust+Reliable')
end

function plot_bars()
    global data
    colors=[[0.5 0.5 0.5];[0.4940 0.1840 0.5560];[0 0.4470 0.7410];[0.8500 0.3250 0.0980];[0.4660 0.6740 0.1880]];
    labels={'Base Design';'Deterministic';'Robust';'Reliable';'Robust+Reliable'};
    
    figure()
    hold on
    bar(data(1:5,5),'FaceColor','flat','CData',colors)
end

function plot_config(x_label,y_label,x_lim,y_lim,legend_data)
    grid on; grid minor
    xlabel(string(x_label))
    ylabel(string(y_label))
    if ~isempty(x_lim)
        xlim(x_lim)
    end
    if ~isempty(y_lim)
        ylim(y_lim)
    end
    if ~isempty(legend_data)
        legend(legend_data)
    end
end
