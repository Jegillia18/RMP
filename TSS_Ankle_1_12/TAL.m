%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, TAL_Marker_ind] =  min(abs(TAL_x - Marker_start_time));  % finding the nearest corresponding time from TAL time domain to Elbow time domain

[~, TAL_Marker_end] =  min(abs(TAL_x - Marker_end_time)); 

[~, TAL_Pre] =  min(abs(TAL_x - TFx_pre)); %this used to be TAL1_x i think i messed up, its just time should be fine
%TAL_trial = TAL1_x(TAL_Marker_ind);
[~, TAL_post] =  min(abs(TAL_x - TFx_post));

TAL_STD = std(TAL_y(TAL_Pre-1:TAL_Marker_ind-1));
TAL_baseline_avg = mean(TAL_y(TAL_Pre-1:TAL_Marker_ind-1));
TAL_SD = TAL_baseline_avg + (TAL_STD*3);


for i = TAL_Marker_ind:TAL_Marker_end
if TAL_y(i) > TAL_SD && TAL_y(i+1) > TAL_SD && TAL_y(i+2) > TAL_SD && TAL_y(i+3) > TAL_SD && TAL_y(i+4) > TAL_SD && TAL_y(i+5) > TAL_SD && TAL_y(i+6) > TAL_SD...
        && TAL_y(i+7) > TAL_SD && TAL_y(i+8) > TAL_SD && TAL_y(i+9) > TAL_SD && TAL_y(i+10) > TAL_SD...
        && TAL_y(i+11) > TAL_SD && TAL_y(i+12) > TAL_SD && TAL_y(i+13) > TAL_SD && TAL_y(i+14) > TAL_SD...
        && TAL_y(i+15) > TAL_SD && TAL_y(i+16) > TAL_SD && TAL_y(i+17) > TAL_SD && TAL_y(i+18) > TAL_SD...
        && TAL_y(i+19) > TAL_SD && TAL_y(i+20) > TAL_SD...
        && TAL_y(i+21) > TAL_SD && TAL_y(i+22) > TAL_SD && TAL_y(i+23) > TAL_SD && TAL_y(i+24) > TAL_SD...
        && TAL_y(i+25) > TAL_SD && TAL_y(i+26) > TAL_SD && TAL_y(i+27) > TAL_SD && TAL_y(i+28) > TAL_SD...
        && TAL_y(i+29) > TAL_SD && TAL_y(i+30) > TAL_SD && TAL_y(i+31) > TAL_SD && TAL_y(i+32) > TAL_SD...
        && TAL_y(i+33) > TAL_SD && TAL_y(i+34) > TAL_SD && TAL_y(i+35) > TAL_SD && TAL_y(i+36) > TAL_SD...
        && TAL_y(i+37) > TAL_SD && TAL_y(i+38) > TAL_SD && TAL_y(i+39) > TAL_SD && TAL_y(i+40) > TAL_SD...
        && TAL_y(i+41) > TAL_SD && TAL_y(i+42) > TAL_SD && TAL_y(i+43) > TAL_SD && TAL_y(i+44) > TAL_SD...
        && TAL_y(i+45) > TAL_SD && TAL_y(i+46) > TAL_SD && TAL_y(i+47) > TAL_SD && TAL_y(i+48) > TAL_SD...
        && TAL_y(i+49) > TAL_SD
   
   
    TAL_Onset_Index = i;
    break
else 
    TAL_Onset_Index = NaN;
end
end

if ~isnan(TAL_Onset_Index)
TAL_onset_time = TAL_x(TAL_Onset_Index);   %putting it in TAL time domain
else
    TAL_onset_time = NaN;
%[~, TAL_trial] =  min(abs(Elbow - TAL_trial));  % finding the nearest corresponding time from TAL time domain to Elbow time domain
end
% if length(TAL_trial) ~= 1
%   TAL_trial(2) = [];
% end
% TAL_Onset = [TAL1_onset_time; TAL2_onset_time; TAL_onset_time];

TAL_Onset = TAL_onset_time;
%% Offset

 if isnan(TAL_Onset_Index) 
    TAL_Offset_Index = Inf;
    TAL_Offset_time = Inf;
%     break
 else
for i = TAL_Onset_Index:TAL_Marker_end

if TAL_y(i) < TAL_SD && TAL_y(i+1) < TAL_SD && TAL_y(i+2) < TAL_SD && TAL_y(i+3) < TAL_SD && TAL_y(i+4) < TAL_SD && TAL_y(i+5) < TAL_SD && TAL_y(i+6) < TAL_SD...
        && TAL_y(i+7) < TAL_SD && TAL_y(i+8) < TAL_SD && TAL_y(i+9) < TAL_SD && TAL_y(i+10) < TAL_SD...
        && TAL_y(i+11) < TAL_SD && TAL_y(i+12) < TAL_SD && TAL_y(i+13) < TAL_SD && TAL_y(i+14) < TAL_SD...
        && TAL_y(i+15) < TAL_SD && TAL_y(i+16) < TAL_SD && TAL_y(i+17) < TAL_SD && TAL_y(i+18) < TAL_SD...
        && TAL_y(i+19) < TAL_SD && TAL_y(i+20) < TAL_SD...
        && TAL_y(i+21) < TAL_SD && TAL_y(i+22) < TAL_SD && TAL_y(i+23) < TAL_SD && TAL_y(i+24) < TAL_SD...
        && TAL_y(i+25) < TAL_SD && TAL_y(i+26) < TAL_SD && TAL_y(i+27) < TAL_SD && TAL_y(i+28) < TAL_SD...
        && TAL_y(i+29) < TAL_SD && TAL_y(i+30) < TAL_SD && TAL_y(i+31) < TAL_SD && TAL_y(i+32) < TAL_SD...
        && TAL_y(i+33) < TAL_SD && TAL_y(i+34) < TAL_SD && TAL_y(i+35) < TAL_SD && TAL_y(i+36) < TAL_SD...
        && TAL_y(i+37) < TAL_SD && TAL_y(i+38) < TAL_SD && TAL_y(i+39) < TAL_SD && TAL_y(i+40) < TAL_SD...
        && TAL_y(i+41) < TAL_SD && TAL_y(i+42) < TAL_SD && TAL_y(i+43) < TAL_SD && TAL_y(i+44) < TAL_SD...
        && TAL_y(i+45) < TAL_SD && TAL_y(i+46) < TAL_SD && TAL_y(i+47) < TAL_SD && TAL_y(i+48) < TAL_SD...
        && TAL_y(i+49) < TAL_SD 
    
    
    
    TAL_Offset_Index = i;
    break
else 
    TAL_Offset_Index = NaN;
end
 end
 
 if ~isnan(TAL_Offset_Index)
TAL_Offset_time = TAL_x(TAL_Offset_Index);   %putting it in TAL time domain
else
    TAL_Offset_time = NaN;
%[~, TAL_trial] =  min(abs(Elbow - TAL_trial));  % finding the nearest corresponding time from TAL time domain to Elbow time domain
 end
end

% TAL_Offset = [TAL1_Offset_time; TAL2_Offset_time; TAL_Offset_time];
TAL_Offset = TAL_Offset_time;
%% Offset from Marker

if isnan(TAL_Onset_Index) 
    TAL_FMO_Index = Inf;
    TAL_FMO_time = Inf;
%     break
 else
try
for i = TAL_Marker_end:(length(TAL_y)-20)


if TAL_y(i) < TAL_SD && TAL_y(i+1) < TAL_SD && TAL_y(i+2) < TAL_SD && TAL_y(i+3) < TAL_SD && TAL_y(i+4) < TAL_SD && TAL_y(i+5) < TAL_SD && TAL_y(i+6) < TAL_SD...
        && TAL_y(i+7) < TAL_SD && TAL_y(i+8) < TAL_SD && TAL_y(i+9) < TAL_SD && TAL_y(i+10) < TAL_SD...
        && TAL_y(i+11) < TAL_SD && TAL_y(i+12) < TAL_SD && TAL_y(i+13) < TAL_SD && TAL_y(i+14) < TAL_SD...
        && TAL_y(i+15) < TAL_SD && TAL_y(i+16) < TAL_SD && TAL_y(i+17) < TAL_SD && TAL_y(i+18) < TAL_SD...
        && TAL_y(i+19) < TAL_SD && TAL_y(i+20) < TAL_SD...
        && TAL_y(i+21) < TAL_SD && TAL_y(i+22) < TAL_SD && TAL_y(i+23) < TAL_SD && TAL_y(i+24) < TAL_SD...
        && TAL_y(i+25) < TAL_SD && TAL_y(i+26) < TAL_SD && TAL_y(i+27) < TAL_SD && TAL_y(i+28) < TAL_SD...
        && TAL_y(i+29) < TAL_SD && TAL_y(i+30) < TAL_SD && TAL_y(i+31) < TAL_SD && TAL_y(i+32) < TAL_SD...
        && TAL_y(i+33) < TAL_SD && TAL_y(i+34) < TAL_SD && TAL_y(i+35) < TAL_SD && TAL_y(i+36) < TAL_SD...
        && TAL_y(i+37) < TAL_SD && TAL_y(i+38) < TAL_SD && TAL_y(i+39) < TAL_SD && TAL_y(i+40) < TAL_SD...
        && TAL_y(i+41) < TAL_SD && TAL_y(i+42) < TAL_SD && TAL_y(i+43) < TAL_SD && TAL_y(i+44) < TAL_SD...
        && TAL_y(i+45) < TAL_SD && TAL_y(i+46) < TAL_SD && TAL_y(i+47) < TAL_SD && TAL_y(i+48) < TAL_SD...
        && TAL_y(i+49) < TAL_SD 
    
    
    TAL_FMO_Index = i;
    break
else 
    TAL_FMO_Index = NaN;
end
 end
 catch
 TAL_FMO_Index = NaN;
end

 if ~isnan(TAL_FMO_Index)
TAL_FMO_time = TAL_x(TAL_FMO_Index);   %putting it in TAL time domain
else
    TAL_FMO_time = NaN;
%[~, TAL_trial] =  min(abs(Elbow - TAL_trial));  % finding the nearest corresponding time from TAL time domain to Elbow time domain
 end
end


% TAL_FMO = [TAL1_FMO_time; TAL2_FMO_time; TAL_FMO_time];
TAL_FMO = TAL_FMO_time;



%% TAL From Marker Times Code
% [~, TAL_Marker_ind] =  min(abs(TAL_x - Marker_start_time));  % finding the nearest corresponding time from TAL time domain to Elbow time domain
% 
% [~, TAL_Marker_end] =  min(abs(TAL_x - Marker_end_time)); 
% 
% [~, TAL_pre] =  min(abs(TAL_x - TFx_pre));

% [~, TAL_post] =  min(abs(TAL_x - TFx_post));

TAL_mean = mean(TAL_y(TAL_Marker_ind:TAL_Marker_end-1));

[TAL_peak, TAL_peak_ind] = max(TAL_y(TAL_Marker_ind:TAL_Marker_end-1));

TAL_peak_ind = (TAL_peak_ind + TAL_Marker_ind)-1;

TAL_T2P = TAL_x(TAL_peak_ind) - TAL_x(TAL_Marker_ind);


% TAL_trial_mean = mean(TAL_y(TAL_Marker_ind:TAL_Marker_end-1));
% 
% TAL_pretrial_mean = mean(TAL_y(TAL_Marker_ind-dur:TAL_Marker_ind-1));
% 
% %TAL_pretrial_mean = mean(TAL_y(1:TAL_Marker_ind-1)); %to use when not 5 sec pre
% 
% TAL_posttrial_mean = mean(TAL_y(TAL_Marker_end:TAL_Marker_end+dur-1));
% 
% %TAL_posttrial_mean = mean(TAL_y(TAL_Marker_end:end)); %to use when not 5 sec post
% 
% [TAL_peak, TAL_peak_ind] = max(TAL_y(TAL_Marker_ind:TAL_Marker_end-1));
% 
% 
% 
%  TAL_trial_time = (TAL_x(TAL_Marker_end) - TAL_x(TAL_Marker_ind));
% 
% %TAL_times = [(TAL_x(TAL_Marker_ind) - TAL_x(1)),TAL_trial_time, (TAL_x(TAL_Marker_end+dur-1)- TAL_x(TAL_Marker_end))]; %pre < 5 
% 
% TAL_times = [(TAL_x(TAL_Marker_ind-1)- TAL_x(TAL_Marker_ind-dur)),TAL_trial_time, TAL_x(end) - TAL_x(TAL_Marker_end)]; %post < 5 

% TAL_Contribution = (TAL_trial_mean/Total_EMG_Mean)*100;
% 
% TAL_Outcomes = [TAL_pretrial_mean, TAL_trial_mean, TAL_posttrial_mean, TAL_peak, TAL_Contribution];




