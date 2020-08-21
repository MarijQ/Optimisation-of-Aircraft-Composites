clear;clc
global data summary

%% Read Data

data = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\design_space_vis_10k.txt');
% for i = 1:10000
%     data{i,'SDLoad'}=data{i,'SDLoad'}+0*(2*rand-1);
%     disp(i)
% end
k=0.5;
data.SDLoad=k*data.SDLoad+k*2.3;
n=1;
data.ReliableLoad=data.MeanLoad-3*(data.SDLoad.^n)/2.07^(n-1);

summary=removevars(data,{'A','B','C','D'});
summary=head(summary,5);
for i = 1:4
    summary{1,i}=min(data{:,i+4});
    summary{2,i}=prctile(data{:,i+4},25);
    summary{3,i}=prctile(data{:,i+4},50);
    summary{4,i}=prctile(data{:,i+4},75);
    summary{5,i}=max(data{:,i+4});
end

%% Master Run Command

% plot_design_variables('A','B','C','D','MeanLoad')
% plot_objective_functions('MeanMass','MeanLoad','ReliableLoad','SDLoad')
plot_grid('MeanMass','MeanLoad','ReliableLoad','SDLoad')

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

function plot_design_variables(varx1,vary1,varx2,vary2,val)
    
    global data
    dotsize=1;
    
    figure('Position', [50 300 1000 400])
    
    subplot(1,2,1);
    contourf(data{:,varx1},data{:,vary1},data{:,val})
    plot_config(varx1,vary1,[min(data{:,varx1}),max(data{:,varx1})],[min(data{:,vary1}),max(data{:,vary1})],[])
    
    subplot(1,2,2);
    scatter(data{:,varx2},data{:,vary2},dotsize,data{:,val})
    plot_config(varx2,vary2,[min(data{:,varx2}),max(data{:,varx2})],[min(data{:,vary2}),max(data{:,vary2})],[])
    
end

function plot_objective_functions(varx,vary,vary2,vary3)
    
    global data
    dotsize=0.5;
    
    figure('Position', [50 300 1600 400])
    
    subplot(1,3,1);
    scatter(data{:,varx},data{:,vary},dotsize,'k.')
    grid on; grid minor
    xlabel(string(varx))
    ylabel(string(vary))
    ylim([30,70])
    
    subplot(1,3,2);
    scatter(data{:,varx},data{:,vary2},dotsize,'r.')
    grid on; grid minor
    xlabel(string(varx))
    ylabel(string(vary2))
    ylim([30,70])
    
    subplot(1,3,3);
    scatter(data{:,varx},data{:,vary3},dotsize,'b.')
    grid on; grid minor
    xlabel(string(varx))
    ylabel(string(vary3))
    
end

%% Old Functions

function gen_2d_plot(var1,var2)
    global data
    dotsize=0.1;
    
    figure()
    hold on
    grid on; grid minor
    x=data{:,var1};
    y=data{:,var2};
    
    scatter(x,y,dotsize,'b.')
    
    xlabel(string(var1))
    ylabel(string(var2))
    hold off
end

function gen_3d_scatter_plot(var1,var2,var3)
    global data
    dotsize=0.5;
    
    x=data{:,var1};
    y=data{:,var2};
    z=data{:,var3};
    
    figure()
    grid on; grid minor
    
    scatter3(x,y,z,dotsize,'b.')
    
    xlabel(string(var1))
    ylabel(string(var2))
    zlabel(string(var3))
end

function gen_3d_surf_plot(var1,var2,var3)
    global data
    dotsize=0.5;
    
    x=data{:,var1};
    y=data{:,var2};
    v=data{:,var3};
    dx=200;
    dy=200;
    xqlims=[min(x),(max(x)-min(x))/dx,max(x)]
    yqlims=[min(y),(max(y)-min(y))/dy,max(y)]
    [xq,yq] = meshgrid(xqlims(1):xqlims(2):xqlims(3),yqlims(1):yqlims(2):yqlims(3));
    vq = griddata(x,y,v,xq,yq,'cubic');
    
    figure()
    grid on; grid minor
    
    surf(xq,yq,vq)
    
    xlabel(string(var1))
    ylabel(string(var2))
    zlabel(string(var3))
end

function plot_grid(varx,vary,vary2,vary3)
    
    global data summary
    dotsize=0.2;
    pareto_dotsize=10;
    eps=0.001;
    
    %Pareto front 1
    eps=0.001;
    dominance=zeros(height(data),1);
    for i = 1:height(data)
        betterpoints = data(data.MeanLoad>data.MeanLoad(i) & data.MeanMass<data.MeanMass(i),:);
%         betterpoints = data(data.SDLoad./data.MeanLoad<data.SDLoad(i)./data.MeanLoad(i) & abs(data.MeanMass-data.MeanMass(i))<eps,:);
        dominance(i)=height(betterpoints);
        disp(i)
    end
    dominance=not(logical(dominance));
    data2=data(dominance,:);
    
    figure('Position', [50 300 1600 400])
        
    %subplot 1
    subplot(1,3,1);
    hold on
    grid on; grid minor
    
    scatter(data{:,varx},data{:,vary},dotsize,'b.')
    scatter(data2{:,varx},data2{:,vary},pareto_dotsize,'MarkerFaceColor','r','MarkerEdgeColor','k')
    
    xlabel(string(varx)); ylabel(string(vary))
    xlim([summary.MeanMass(1),summary.MeanMass(5)]); ylim([30,70])
    hold off
    
    %subplot 2
    subplot(1,3,2);
    hold on
    grid on; grid minor
    
    scatter(data{:,varx},data{:,vary2},dotsize,'b.')
    scatter(data2{:,varx},data2{:,vary2},pareto_dotsize,'MarkerFaceColor','r','MarkerEdgeColor','k')
    
    xlabel(string(varx)); ylabel(string(vary2))
    xlim([summary.MeanMass(1),summary.MeanMass(5)]); ylim([30,70])
    hold off
    
    %subplot 3
    subplot(1,3,3);
    hold on
    grid on; grid minor
    
    scatter(data{:,varx},data{:,vary3},dotsize,'b.')
    scatter(data2{:,varx},data2{:,vary3},pareto_dotsize,'MarkerFaceColor','r','MarkerEdgeColor','k')
    
    xlabel(string(varx)); ylabel(string(vary3))
    xlim([summary.MeanMass(1),summary.MeanMass(5)]);
    hold off
end

function plot_eigval_surface()
    %Mass as indep. variable
    global data
    dotsize=0.5;
    
    figure()
    hold on
    grid on; grid minor
    
    yyaxis left
    scatter(data(:,6),data(:,5),dotsize,'k.')
    scatter(data(:,6),data(:,7),dotsize,'r.')
    ylabel('Eigval')
    
    yyaxis right
    scatter(data(:,6),data(:,8),dotsize,'b.')
    ylabel('SD Eigval')
    
    xlabel('Mass')
    legend('Mean','Reliable','SD','Location','northwest')
    hold off
end