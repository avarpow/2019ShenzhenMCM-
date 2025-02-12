function init()
    clear;
    clc;
    clc;
    clear;  %清空所有操作
    load raw_data
    global Mag
    global Mag_pow10
    global Phase_raw 
    global Phase
    global Phase_cos
    global Phase_sin
   
   Mag = raw_data.LogMag;
   Mag(find(isnan(Mag))) = -10;
   Mag(find(isinf(Mag))) = -10;
   Mag_pow10= (10.^(Mag/20));
   Phase_raw = raw_data.Phase;
   Phase_raw(find(isnan(Phase_raw))) = 0;
   Phase_raw(find(isinf(Phase_raw))) = 0;
   Phase=Phase_raw/180*pi;
   Phase(find(isnan(Phase))) = 0;
   Phase(find(isinf(Phase))) = 0;
   Phase_cos=cos(Phase);
   Phase_sin=sin(Phase);  %LogMag和Phase数据处理，将inf和nan全部变成0;
   
   