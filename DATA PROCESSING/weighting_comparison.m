clear;clc
global data envelope

%% Read Data

data = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\weighting_comparison4.txt');
envelope = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\design_space_vis_10k.txt');

%% Master Run Command

% plot_weights('MeanMass','MeanLoad','ReliableLoad','SDLoad',1,1)
% plot_weights('MeanMass','MeanLoad','ReliableLoad','SDLoad',2,8)
% plot_weights('MeanMass','MeanLoad','ReliableLoad','SDLoad',9,15)
% plot_weights('MeanMass','MeanLoad','ReliableLoad','SDLoad',16,22)
plot_pareto('MeanMass','MeanLoad','ReliableLoad','SDLoad',1,1)

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

function plot_weights(varx,vary,vary2,vary3,startconfig,endconfig)
    global data envelope
    dotsize=100;
    
    figure('Position', [50 300 1600 400])
    
    subplot(1,3,1);
    hold on
    scatter(envelope{:,varx},envelope{:,vary},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    for i = startconfig:endconfig
        plot(data{data.Config==i,varx},data{data.Config==i,vary},'x-','DisplayName',string(i),'LineWidth',2)
    end  
    hold off
    plot_config(varx,vary,[],[30,70],[])
    legend('Location','northwest','NumColumns',2)
    
    subplot(1,3,2);
    hold on
    scatter(envelope{:,varx},envelope{:,vary2},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    for i = startconfig:endconfig
        plot(data{data.Config==i,varx},data{data.Config==i,vary2},'x-','DisplayName',string(i),'LineWidth',2)
    end 
    hold off
    grid on; grid minor
    plot_config(varx,vary2,[],[30,70],[])
    legend('Location','northwest','NumColumns',2)
    
    subplot(1,3,3);
    hold on
    scatter(envelope{:,varx},envelope{:,vary3},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    for i = startconfig:endconfig
        plot(data{data.Config==i,varx},data{data.Config==i,vary3},'x-','DisplayName',string(i),'LineWidth',2)
    end
    hold off
    grid on; grid minor
    plot_config(varx,vary3,[],[],[])
    legend('Location','northwest','NumColumns',2)
   
end

function plot_pareto(varx,vary,vary2,vary3,startconfig,endconfig)
    global data envelope
    dotsize=100;
    
    %find pareto points
    envelope.ParetoMean=zeros(10000,1);
    envelope.ParetoRel=zeros(10000,1);
    envelope.ParetoSD=zeros(10000,1);
    for i = 1:10000
        if
    end
    
    figure('Position', [50 300 1600 400])
    
    subplot(1,3,1);
    hold on
    scatter(envelope{:,varx},envelope{:,vary},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    for i = startconfig:endconfig
        plot(data{data.Config==i,varx},data{data.Config==i,vary},'x-','DisplayName',string(i),'LineWidth',2)
    end  
    hold off
    plot_config(varx,vary,[],[30,70],[])
    legend('Location','northwest','NumColumns',2)
    
    subplot(1,3,2);
    hold on
    scatter(envelope{:,varx},envelope{:,vary2},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    for i = startconfig:endconfig
        plot(data{data.Config==i,varx},data{data.Config==i,vary2},'x-','DisplayName',string(i),'LineWidth',2)
    end 
    hold off
    grid on; grid minor
    plot_config(varx,vary2,[],[30,70],[])
    legend('Location','northwest','NumColumns',2)
    
    subplot(1,3,3);
    hold on
    scatter(envelope{:,varx},envelope{:,vary3},dotsize/1000,'.','MarkerEdgeColor',[0.5,0.5,0.5])
    for i = startconfig:endconfig
        plot(data{data.Config==i,varx},data{data.Config==i,vary3},'x-','DisplayName',string(i),'LineWidth',2)
    end
    hold off
    grid on; grid minor
    plot_config(varx,vary3,[],[],[])
    legend('Location','northwest','NumColumns',2)
   
end
