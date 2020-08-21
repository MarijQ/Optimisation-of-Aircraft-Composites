clear;clc

%% Read Data

data = readtable('D:\Google Drive\4th Year\FYP\DATA PROCESSING\Result Data\design_space_vis_10k.txt');

scatter3(data{:,'MeanMass'},data{:,'MeanEigval'},data{:,'SDEigval'})