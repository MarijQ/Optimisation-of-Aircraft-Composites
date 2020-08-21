clear;clc
global det hyb envelope

%% Read Data

det = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\pareto_front_det.txt');
hyb = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\pareto_front_hyb.txt');
envelope = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\design_space_vis_10k.txt');

%% Master Run Command

% plot_fronts('MeanMass','MeanLoad','ReliableLoad','SDLoad')
plot_shapes()

%% Functions

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

function plot_fronts(varx,vary,vary2,vary3)
    global det hyb envelope
    dotsize=15;
    
    figure('Position', [50 300 1600 400])
    
    subplot(1,3,1);
    hold on
    scatter(envelope{:,varx},envelope{:,vary},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    scatter(det{:,varx},det{:,vary},dotsize,'r','filled','MarkerEdgeColor','k')
    scatter(hyb{:,varx},hyb{:,vary},dotsize,'g','filled','MarkerEdgeColor','k')
    hold off
    plot_config(varx,vary,[],[30,70],[])
    legend('Envelope','Deterministic','Hybrid','Location','northwest')
    
    subplot(1,3,2);
    hold on
    scatter(envelope{:,varx},envelope{:,vary2},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    scatter(det{:,varx},det{:,vary2},dotsize,'r','filled','MarkerEdgeColor','k')
    scatter(hyb{:,varx},hyb{:,vary2},dotsize,'g','filled','MarkerEdgeColor','k')
    hold off
    plot_config(varx,vary2,[],[30,70],[])
    legend('Envelope','Deterministic','Hybrid','Location','northwest')
    
    subplot(1,3,3);
    hold on
    scatter(envelope{:,varx},envelope{:,vary3},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    scatter(det{:,varx},det{:,vary3},dotsize,'r','filled','MarkerEdgeColor','k')
    scatter(hyb{:,varx},hyb{:,vary3},dotsize,'g','filled','MarkerEdgeColor','k')
    hold off
    plot_config(varx,vary3,[],[],[])
    legend('Envelope','Deterministic','Hybrid','Location','northwest')
   
end

function plot_shapes()
%% Read Data
    load('pareto_shapes_data.mat')

    figure('Position', [50 200 800 700])
    hold on
    axis off
    xlim([-76,76]),ylim([0,150])
    for i=1:5
        plot_shape(shapes(i,1),shapes(i,2),shapes(i,3),shapes(i,4),2.208,i)
    end
    legend('820g','840g','860g','880g','900g')
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