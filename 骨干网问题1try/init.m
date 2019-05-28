function init()
clear all;
clc;
%计算距离用到的值
global city_num
global city_x
global city_y
global normalization_factor
global requirements
global tau %信息素浓度矩阵
global ant_num %蚂蚁个数 
global tau_factor %表征信息素重要程度的参数??
global power_factor %表征启发式因子重要程度的参数??
global tau_decline %信息素蒸发系数??
global tau_increase %信息素增加强度系数?
city_x=[474 455 532 450 449 486 380 506 571 609 326 511 646 314 119 181 726 844 809];
city_y=[322 334 331 391 251 408 322 433 400 334 349 113 240 488 566 501 362 264 176];
city_num=length(city_x);
normalization_factor=0.85079834;
%网络流量需求
requirements=[100.00 65.68 68.78 43.23 36.12 43.53 39.04 37.24 92.21 46.82 28.55 32.72 31.20 30.74 52.24 47.80 46.31 107.06 37.94];
%蚁群算法参数?
tau=ones(length(city_x),length(city_y));%信息素浓度矩阵
ant_num=50;%蚂蚁个数??
tau_factor=2;%表征信息素重要程度的参数??
power_factor=1;%表征启发式因子重要程度的参数??
tau_decline=0.1;%信息素蒸发系数??
tau_increase=0.1;%信息素增加强度系数??
