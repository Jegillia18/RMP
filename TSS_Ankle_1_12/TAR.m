%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, TAR_Marker_ind] =  min(abs(TAR_x - Marker_start_time));  % finding the nearest corresponding time from TAR time domain to Elbow time domain

[~, TAR_Marker_end] =  min(abs(TAR_x - Marker_end_time)); 

[~, TAR_Pre] =  min(abs(TAR_x - TFx_pre)); %this used to be TAR1_x i think i messed up, its just time should be fine
%TAR_trial = TAR1_x(TAR_Marker_ind);
[~, TAR_post] =  min(abs(TAR_x - TFx_post));

TAR_STD = std(TAR_y(TAR_Pre-1:TAR_Marker_ind-1));
TAR_baseline_avg = mean(TAR_y(TAR_Pre-1:TAR_Marker_ind-1));
TAR_SD = TAR_baseline_avg + (TAR_STD*3);


for i = TAR_Marker_ind:TAR_Marker_end
if TAR_y(i) > TAR_SD && TAR_y(i+1) > TAR_SD && TAR_y(i+2) > TAR_SD && TAR_y(i+3) > TAR_SD && TAR_y(i+4) > TAR_SD && TAR_y(i+5) > TAR_SD && TAR_y(i+6) > TAR_SD...
        && TAR_y(i+7) > TAR_SD && TAR_y(i+8) > TAR_SD && TAR_y(i+9) > TAR_SD && TAR_y(i+10) > TAR_SD...
        && TAR_y(i+11) > TAR_SD && TAR_y(i+12) > TAR_SD && TAR_y(i+13) > TAR_SD && TAR_y(i+14) > TAR_SD...
        && TAR_y(i+15) > TAR_SD && TAR_y(i+16) > TAR_SD && TAR_y(i+17) > TAR_SD && TAR_y(i+18) > TAR_SD...
        && TAR_y(i+19) > TAR_SD && TAR_y(i+20) > TAR_SD...
        && TAR_y(i+21) > TAR_SD && TAR_y(i+22) > TAR_SD && TAR_y(i+23) > TAR_SD && TAR_y(i+24) > TAR_SD...
        && TAR_y(i+25) > TAR_SD && TAR_y(i+26) > TAR_SD && TAR_y(i+27) > TAR_SD && TAR_y(i+28) > TAR_SD...
        && TAR_y(i+29) > TAR_SD && TAR_y(i+30) > TAR_SD && TAR_y(i+31) > TAR_SD && TAR_y(i+32) > TAR_SD...
        && TAR_y(i+33) > TAR_SD && TAR_y(i+34) > TAR_SD && TAR_y(i+35) > TAR_SD && TAR_y(i+36) > TAR_SD...
        && TAR_y(i+37) > TAR_SD && TAR_y(i+38) > TAR_SD && TAR_y(i+39) > TAR_SD && TAR_y(i+40) > TAR_SD...
        && TAR_y(i+41) > TAR_SD && TAR_y(i+42) > TAR_SD && TAR_y(i+43) > TAR_SD && TAR_y(i+44) > TAR_SD...
        && TAR_y(i+45) > TAR_SD && TAR_y(i+46) > TAR_SD && TAR_y(i+47) > TAR_SD && TAR_y(i+48) > TAR_SD...
        && TAR_y(i+49) > TAR_SD
   
   
    TAR_Onset_Index = i;
    break
else 
    TAR_Onset_Index = NaN;
end
end

if ~isnan(TAR_Onset_Index)
TAR_onset_time = TAR_x(TAR_Onset_Index);   %putting it in TAR time domain
else
    TAR_onset_time = NaN;
%[~, TAR_trial] =  min(abs(Elbow - TAR_trial));  % finding the nearest corresponding time from TAR time domain to Elbow time domain
end
% if length(TAR_trial) ~= 1
%   TAR_trial(2) = [];
% end
% TAR_Onset = [TAR1_onset_time; TAR2_onset_time; TAR_onset_time];

TAR_Onset = TAR_onset_time;
%% Offset

 if isnan(TAR_Onset_Index) 
    TAR_Offset_Index = Inf;
    TAR_Offset_time = Inf;
%     break
 else
for i = TAR_Onset_Index:TAR_Marker_end

if TAR_y(i) < TAR_SD && TAR_y(i+1) < TAR_SD && TAR_y(i+2) < TAR_SD && TAR_y(i+3) < TAR_SD && TAR_y(i+4) < TAR_SD && TAR_y(i+5) < TAR_SD && TAR_y(i+6) < TAR_SD...
        && TAR_y(i+7) < TAR_SD && TAR_y(i+8) < TAR_SD && TAR_y(i+9) < TAR_SD && TAR_y(i+10) < TAR_SD...
        && TAR_y(i+11) < TAR_SD && TAR_y(i+12) < TAR_SD && TAR_y(i+13) < TAR_SD && TAR_y(i+14) < TAR_SD...
        && TAR_y(i+15) < TAR_SD && TAR_y(i+16) < TAR_SD && TAR_y(i+17) < TAR_SD && TAR_y(i+18) < TAR_SD...
        && TAR_y(i+19) < TAR_SD && TAR_y(i+20) < TAR_SD...
        && TAR_y(i+21) < TAR_SD && TAR_y(i+22) < TAR_SD && TAR_y(i+23) < TAR_SD && TAR_y(i+24) < TAR_SD...
        && TAR_y(i+25) < TAR_SD && TAR_y(i+26) < TAR_SD && TAR_y(i+27) < TAR_SD && TAR_y(i+28) < TAR_SD...
        && TAR_y(i+29) < TAR_SD && TAR_y(i+30) < TAR_SD && TAR_y(i+31) < TAR_SD && TAR_y(i+32) < TAR_SD...
        && TAR_y(i+33) < TAR_SD && TAR_y(i+34) < TAR_SD && TAR_y(i+35) < TAR_SD && TAR_y(i+36) < TAR_SD...
        && TAR_y(i+37) < TAR_SD && TAR_y(i+38) < TAR_SD && TAR_y(i+39) < TAR_SD && TAR_y(i+40) < TAR_SD...
        && TAR_y(i+41) < TAR_SD && TAR_y(i+42) < TAR_SD && TAR_y(i+43) < TAR_SD && TAR_y(i+44) < TAR_SD...
        && TAR_y(i+45) < TAR_SD && TAR_y(i+46) < TAR_SD && TAR_y(i+47) < TAR_SD && TAR_y(i+48) < TAR_SD...
        && TAR_y(i+49) < TAR_SD 
    
    
    
    TAR_Offset_Index = i;
    break
else 
    TAR_Offset_Index = NaN;
end
 end
 
 if ~isnan(TAR_Offset_Index)
TAR_Offset_time = TAR_x(TAR_Offset_Index);   %putting it in TAR time domain
else
    TAR_Offset_time = NaN;
%[~, TAR_trial] =  min(abs(Elbow - TAR_trial));  % finding the nearest corresponding time from TAR time domain to Elbow time domain
 end
end

% TAR_Offset = [TAR1_Offset_time; TAR2_Offset_time; TAR_Offset_time];
TAR_Offset = TAR_Offset_time;
%% Offset from Marker

if isnan(TAR_Onset_Index) 
    TAR_FMO_Index = Inf;
    TAR_FMO_time = Inf;
%     break
 else
try
for i = TAR_Marker_end:(length(TAR_y)-20)


if TAR_y(i) < TAR_SD && TAR_y(i+1) < TAR_SD && TAR_y(i+2) < TAR_SD && TAR_y(i+3) < TAR_SD && TAR_y(i+4) < TAR_SD && TAR_y(i+5) < TAR_SD && TAR_y(i+6) < TAR_SD...
        && TAR_y(i+7) < TAR_SD && TAR_y(i+8) < TAR_SD && TAR_y(i+9) < TAR_SD && TAR_y(i+10) < TAR_SD...
        && TAR_y(i+11) < TAR_SD && TAR_y(i+12) < TAR_SD && TAR_y(i+13) < TAR_SD && TAR_y(i+14) < TAR_SD...
        && TAR_y(i+15) < TAR_SD && TAR_y(i+16) < TAR_SD && TAR_y(i+17) < TAR_SD && TAR_y(i+18) < TAR_SD...
        && TAR_y(i+19) < TAR_SD && TAR_y(i+20) < TAR_SD...
        && TAR_y(i+21) < TAR_SD && TAR_y(i+22) < TAR_SD && TAR_y(i+23) < TAR_SD && TAR_y(i+24) < TAR_SD...
        && TAR_y(i+25) < TAR_SD && TAR_y(i+26) < TAR_SD && TAR_y(i+27) < TAR_SD && TAR_y(i+28) < TAR_SD...
        && TAR_y(i+29) < TAR_SD && TAR_y(i+30) < TAR_SD && TAR_y(i+31) < TAR_SD && TAR_y(i+32) < TAR_SD...
        && TAR_y(i+33) < TAR_SD && TAR_y(i+34) < TAR_SD && TAR_y(i+35) < TAR_SD && TAR_y(i+36) < TAR_SD...
        && TAR_y(i+37) < TAR_SD && TAR_y(i+38) < TAR_SD && TAR_y(i+39) < TAR_SD && TAR_y(i+40) < TAR_SD...
        && TAR_y(i+41) < TAR_SD && TAR_y(i+42) < TAR_SD && TAR_y(i+43) < TAR_SD && TAR_y(i+44) < TAR_SD...
        && TAR_y(i+45) < TAR_SD && TAR_y(i+46) < TAR_SD && TAR_y(i+47) < TAR_SD && TAR_y(i+48) < TAR_SD...
        && TAR_y(i+49) < TAR_SD 
    
    
    TAR_FMO_Index = i;
    break
else 
    TAR_FMO_Index = NaN;
end
 end
 catch
 TAR_FMO_Index = NaN;
end

 if ~isnan(TAR_FMO_Index)
TAR_FMO_time = TAR_x(TAR_FMO_Index);   %putting it in TAR time domain
else
    TAR_FMO_time = NaN;
%[~, TAR_trial] =  min(abs(Elbow - TAR_trial));  % finding the nearest corresponding time from TAR time domain to Elbow time domain
 end
end


% TAR_FMO = [TAR1_FMO_time; TAR2_FMO_time; TAR_FMO_time];
TAR_FMO = TAR_FMO_time;



%% TAR From Marker Times Code
% [~, TAR_Marker_ind] =  min(abs(TAR_x - Marker_start_time));  % finding the nearest corresponding time from TAR time domain to Elbow time domain
% 
% [~, TAR_Marker_end] =  min(abs(TAR_x - Marker_end_time)); 
% 
% [~, TAR_pre] =  min(abs(TAR_x - TFx_pre));

% [~, TAR_post] =  min(abs(TAR_x - TFx_post));

TAR_mean = mean(TAR_y(TAR_Marker_ind:TAR_Marker_end-1));

[TAR_peak, TAR_peak_ind] = max(TAR_y(TAR_Marker_ind:TAR_Marker_end-1));

TAR_peak_ind = (TAR_peak_ind + TAR_Marker_ind)-1;

TAR_T2P = TAR_x(TAR_peak_ind) - TAR_x(TAR_Marker_ind);


% 
% TAR_trial_mean = mean(TAR_y(TAR_Marker_ind:TAR_Marker_end-1));
% 
% TAR_pretrial_mean = mean(TAR_y(TAR_Marker_ind-dur:TAR_Marker_ind-1));
% 
% %TAR_pretrial_mean = mean(TAR_y(1:TAR_Marker_ind-1)); %to use when not 5 sec pre
% 
% TAR_posttrial_mean = mean(TAR_y(TAR_Marker_end:TAR_Marker_end+dur-1));
% 
% %TAR_posttrial_mean = mean(TAR_y(TAR_Marker_end:end)); %to use when not 5 sec post
% 
% [TAR_peak, TAR_peak_ind] = max(TAR_y(TAR_Marker_ind:TAR_Marker_end-1));
% 
% 
% 
%  TAR_trial_time = (TAR_x(TAR_Marker_end) - TAR_x(TAR_Marker_ind));
% 
% %TAR_times = [(TAR_x(TAR_Marker_ind) - TAR_x(1)),TAR_trial_time, (TAR_x(TAR_Marker_end+dur-1)- TAR_x(TAR_Marker_end))]; %pre < 5 
% 
% TAR_times = [(TAR_x(TAR_Marker_ind-1)- TAR_x(TAR_Marker_ind-dur)),TAR_trial_time, TAR_x(end) - TAR_x(TAR_Marker_end)]; %post < 5 

% TAR_Contribution = (TAR_trial_mean/Total_EMG_Mean)*100;
% 
% TAR_Outcomes = [TAR_pretrial_mean, TAR_trial_mean, TAR_posttrial_mean, TAR_peak, TAR_Contribution];




