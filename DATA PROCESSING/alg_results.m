clear;clc

%% Master Run Command

% plot_all_iterations()
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

function plot_all_iterations()
    lsgrg = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\alg_lsgrg_imp.txt');
    simplex = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\alg_simplex_imp.txt');
    swarm = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\alg_swarm_imp.txt');
    miga = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\alg_miga_imp.txt');
    pointer = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\alg_pointer_imp.txt');
    
    hold on
    plot_iterations(lsgrg,'-x')
    plot_iterations(simplex,'-x')
    plot_iterations(swarm,'-x')
    plot_iterations(miga,'-x')
    plot_iterations(pointer,'-x')
end

function plot_iterations(data,style)
    final=inf(max(data{:,3}),2);
    final(:,1)=1:max(data{:,3});
    for i = 1:length(data{:,1})
        final(data{i,3},2)=data{i,14};
    end
    for i = 1:length(final(:,1))
        final(i,2)=min(final(1:i,2));
    end
    plot(final(:,1)/max(data{:,3}),final(:,2),style,'LineWidth',1)
    plot_config('% Iterations','Objective Function',[],[],[])
    legend('LSGRG','Simplex','Particle Swarm','Multi Island GA','Pointer')
end

function plot_shapes()
%% Read Data
    load('alg_shapes_data.mat')

    figure('Position', [50 200 800 440])
    hold on
    axis off
    xlim([-76,76]),ylim([0,90])
    for i=1:3
        plot_shape(shapes(i,1),shapes(i,2),shapes(i,3),shapes(i,4),2.208,i)
    end
    legend('LSGRG','Simplex','PSO/MIGA/Pointer')
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