%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, SolL_Marker_ind] =  min(abs(SolL_x - Marker_start_time));  % finding the nearest corresponding time from SolL time domain to Elbow time domain

[~, SolL_Marker_end] =  min(abs(SolL_x - Marker_end_time)); 

[~, SolL_Pre] =  min(abs(SolL_x - TFx_pre)); %this used to be SolL1_x i think i messed up, its just time should be fine
%SolL_trial = SolL1_x(SolL_Marker_ind);
[~, SolL_post] =  min(abs(SolL_x - TFx_post));

SolL_STD = std(SolL_y(SolL_Pre-1:SolL_Marker_ind-1));
SolL_baseline_avg = mean(SolL_y(SolL_Pre-1:SolL_Marker_ind-1));
SolL_SD = SolL_baseline_avg + (SolL_STD*3);


for i = SolL_Marker_ind:SolL_Marker_end
if SolL_y(i) > SolL_SD && SolL_y(i+1) > SolL_SD && SolL_y(i+2) > SolL_SD && SolL_y(i+3) > SolL_SD && SolL_y(i+4) > SolL_SD && SolL_y(i+5) > SolL_SD && SolL_y(i+6) > SolL_SD...
        && SolL_y(i+7) > SolL_SD && SolL_y(i+8) > SolL_SD && SolL_y(i+9) > SolL_SD && SolL_y(i+10) > SolL_SD...
        && SolL_y(i+11) > SolL_SD && SolL_y(i+12) > SolL_SD && SolL_y(i+13) > SolL_SD && SolL_y(i+14) > SolL_SD...
        && SolL_y(i+15) > SolL_SD && SolL_y(i+16) > SolL_SD && SolL_y(i+17) > SolL_SD && SolL_y(i+18) > SolL_SD...
        && SolL_y(i+19) > SolL_SD && SolL_y(i+20) > SolL_SD...
        && SolL_y(i+21) > SolL_SD && SolL_y(i+22) > SolL_SD && SolL_y(i+23) > SolL_SD && SolL_y(i+24) > SolL_SD...
        && SolL_y(i+25) > SolL_SD && SolL_y(i+26) > SolL_SD && SolL_y(i+27) > SolL_SD && SolL_y(i+28) > SolL_SD...
        && SolL_y(i+29) > SolL_SD && SolL_y(i+30) > SolL_SD && SolL_y(i+31) > SolL_SD && SolL_y(i+32) > SolL_SD...
        && SolL_y(i+33) > SolL_SD && SolL_y(i+34) > SolL_SD && SolL_y(i+35) > SolL_SD && SolL_y(i+36) > SolL_SD...
        && SolL_y(i+37) > SolL_SD && SolL_y(i+38) > SolL_SD && SolL_y(i+39) > SolL_SD && SolL_y(i+40) > SolL_SD...
        && SolL_y(i+41) > SolL_SD && SolL_y(i+42) > SolL_SD && SolL_y(i+43) > SolL_SD && SolL_y(i+44) > SolL_SD...
        && SolL_y(i+45) > SolL_SD && SolL_y(i+46) > SolL_SD && SolL_y(i+47) > SolL_SD && SolL_y(i+48) > SolL_SD...
        && SolL_y(i+49) > SolL_SD
   
   
    SolL_Onset_Index = i;
    break
else 
    SolL_Onset_Index = NaN;
end
end

if ~isnan(SolL_Onset_Index)
SolL_onset_time = SolL_x(SolL_Onset_Index);   %putting it in SolL time domain
else
    SolL_onset_time = NaN;
%[~, SolL_trial] =  min(abs(Elbow - SolL_trial));  % finding the nearest corresponding time from SolL time domain to Elbow time domain
end
% if length(SolL_trial) ~= 1
%   SolL_trial(2) = [];
% end
% SolL_Onset = [SolL1_onset_time; SolL2_onset_time; SolL_onset_time];

SolL_Onset = SolL_onset_time;
%% Offset

 if isnan(SolL_Onset_Index) 
    SolL_Offset_Index = Inf;
    SolL_Offset_time = Inf;
%     break
 else
for i = SolL_Onset_Index:SolL_Marker_end

if SolL_y(i) < SolL_SD && SolL_y(i+1) < SolL_SD && SolL_y(i+2) < SolL_SD && SolL_y(i+3) < SolL_SD && SolL_y(i+4) < SolL_SD && SolL_y(i+5) < SolL_SD && SolL_y(i+6) < SolL_SD...
        && SolL_y(i+7) < SolL_SD && SolL_y(i+8) < SolL_SD && SolL_y(i+9) < SolL_SD && SolL_y(i+10) < SolL_SD...
        && SolL_y(i+11) < SolL_SD && SolL_y(i+12) < SolL_SD && SolL_y(i+13) < SolL_SD && SolL_y(i+14) < SolL_SD...
        && SolL_y(i+15) < SolL_SD && SolL_y(i+16) < SolL_SD && SolL_y(i+17) < SolL_SD && SolL_y(i+18) < SolL_SD...
        && SolL_y(i+19) < SolL_SD && SolL_y(i+20) < SolL_SD...
        && SolL_y(i+21) < SolL_SD && SolL_y(i+22) < SolL_SD && SolL_y(i+23) < SolL_SD && SolL_y(i+24) < SolL_SD...
        && SolL_y(i+25) < SolL_SD && SolL_y(i+26) < SolL_SD && SolL_y(i+27) < SolL_SD && SolL_y(i+28) < SolL_SD...
        && SolL_y(i+29) < SolL_SD && SolL_y(i+30) < SolL_SD && SolL_y(i+31) < SolL_SD && SolL_y(i+32) < SolL_SD...
        && SolL_y(i+33) < SolL_SD && SolL_y(i+34) < SolL_SD && SolL_y(i+35) < SolL_SD && SolL_y(i+36) < SolL_SD...
        && SolL_y(i+37) < SolL_SD && SolL_y(i+38) < SolL_SD && SolL_y(i+39) < SolL_SD && SolL_y(i+40) < SolL_SD...
        && SolL_y(i+41) < SolL_SD && SolL_y(i+42) < SolL_SD && SolL_y(i+43) < SolL_SD && SolL_y(i+44) < SolL_SD...
        && SolL_y(i+45) < SolL_SD && SolL_y(i+46) < SolL_SD && SolL_y(i+47) < SolL_SD && SolL_y(i+48) < SolL_SD...
        && SolL_y(i+49) < SolL_SD 
    
    
    
    SolL_Offset_Index = i;
    break
else 
    SolL_Offset_Index = NaN;
end
 end
 
 if ~isnan(SolL_Offset_Index)
SolL_Offset_time = SolL_x(SolL_Offset_Index);   %putting it in SolL time domain
else
    SolL_Offset_time = NaN;
%[~, SolL_trial] =  min(abs(Elbow - SolL_trial));  % finding the nearest corresponding time from SolL time domain to Elbow time domain
 end
end

% SolL_Offset = [SolL1_Offset_time; SolL2_Offset_time; SolL_Offset_time];
SolL_Offset = SolL_Offset_time;
%% Offset from Marker

if isnan(SolL_Onset_Index) 
    SolL_FMO_Index = Inf;
    SolL_FMO_time = Inf;
%     break
 else
try
for i = SolL_Marker_end:(length(SolL_y)-20)


if SolL_y(i) < SolL_SD && SolL_y(i+1) < SolL_SD && SolL_y(i+2) < SolL_SD && SolL_y(i+3) < SolL_SD && SolL_y(i+4) < SolL_SD && SolL_y(i+5) < SolL_SD && SolL_y(i+6) < SolL_SD...
        && SolL_y(i+7) < SolL_SD && SolL_y(i+8) < SolL_SD && SolL_y(i+9) < SolL_SD && SolL_y(i+10) < SolL_SD...
        && SolL_y(i+11) < SolL_SD && SolL_y(i+12) < SolL_SD && SolL_y(i+13) < SolL_SD && SolL_y(i+14) < SolL_SD...
        && SolL_y(i+15) < SolL_SD && SolL_y(i+16) < SolL_SD && SolL_y(i+17) < SolL_SD && SolL_y(i+18) < SolL_SD...
        && SolL_y(i+19) < SolL_SD && SolL_y(i+20) < SolL_SD...
        && SolL_y(i+21) < SolL_SD && SolL_y(i+22) < SolL_SD && SolL_y(i+23) < SolL_SD && SolL_y(i+24) < SolL_SD...
        && SolL_y(i+25) < SolL_SD && SolL_y(i+26) < SolL_SD && SolL_y(i+27) < SolL_SD && SolL_y(i+28) < SolL_SD...
        && SolL_y(i+29) < SolL_SD && SolL_y(i+30) < SolL_SD && SolL_y(i+31) < SolL_SD && SolL_y(i+32) < SolL_SD...
        && SolL_y(i+33) < SolL_SD && SolL_y(i+34) < SolL_SD && SolL_y(i+35) < SolL_SD && SolL_y(i+36) < SolL_SD...
        && SolL_y(i+37) < SolL_SD && SolL_y(i+38) < SolL_SD && SolL_y(i+39) < SolL_SD && SolL_y(i+40) < SolL_SD...
        && SolL_y(i+41) < SolL_SD && SolL_y(i+42) < SolL_SD && SolL_y(i+43) < SolL_SD && SolL_y(i+44) < SolL_SD...
        && SolL_y(i+45) < SolL_SD && SolL_y(i+46) < SolL_SD && SolL_y(i+47) < SolL_SD && SolL_y(i+48) < SolL_SD...
        && SolL_y(i+49) < SolL_SD 
    
    
    SolL_FMO_Index = i;
    break
else 
    SolL_FMO_Index = NaN;
end
 end
 catch
 SolL_FMO_Index = NaN;
end

 if ~isnan(SolL_FMO_Index)
SolL_FMO_time = SolL_x(SolL_FMO_Index);   %putting it in SolL time domain
else
    SolL_FMO_time = NaN;
%[~, SolL_trial] =  min(abs(Elbow - SolL_trial));  % finding the nearest corresponding time from SolL time domain to Elbow time domain
 end
end


% SolL_FMO = [SolL1_FMO_time; SolL2_FMO_time; SolL_FMO_time];
SolL_FMO = SolL_FMO_time;



%% SolL From Marker Times Code
% [~, SolL_Marker_ind] =  min(abs(SolL_x - Marker_start_time));  % finding the nearest corresponding time from SolL time domain to Elbow time domain
% 
% [~, SolL_Marker_end] =  min(abs(SolL_x - Marker_end_time)); 
% 
% [~, SolL_pre] =  min(abs(SolL_x - TFx_pre));

% [~, SolL_post] =  min(abs(SolL_x - TFx_post));

SolL_mean = mean(SolL_y(SolL_Marker_ind:SolL_Marker_end-1));

[SolL_peak, SolL_peak_ind] = max(SolL_y(SolL_Marker_ind:SolL_Marker_end-1));

SolL_peak_ind = (SolL_peak_ind + SolL_Marker_ind)-1;

SolL_T2P = SolL_x(SolL_peak_ind) - SolL_x(SolL_Marker_ind);







% 
% SolL_pretrial_mean = mean(SolL_y(SolL_Marker_ind-dur:SolL_Marker_ind-1));
% 
% %SolL_pretrial_mean = mean(SolL_y(1:SolL_Marker_ind-1)); %to use when not 5 sec pre
% 
% SolL_posttrial_mean = mean(SolL_y(SolL_Marker_end:SolL_Marker_end+dur-1));
% 
% %SolL_posttrial_mean = mean(SolL_y(SolL_Marker_end:end)); %to use when not 5 sec post
% 
% [SolL_peak, SolL_peak_ind] = max(SolL_y(SolL_Marker_ind:SolL_Marker_end-1));



% SolL_trial_time = (SolL_x(SolL_Marker_end) - SolL_x(SolL_Marker_ind));
% 
% %SolL_times = [(SolL_x(SolL_Marker_ind) - SolL_x(1)),SolL_trial_time, (SolL_x(SolL_Marker_end+dur-1)- SolL_x(SolL_Marker_end))]; %pre < 5 
% 
% SolL_times = [(SolL_x(SolL_Marker_ind-1)- SolL_x(SolL_Marker_ind-dur)),SolL_trial_time, SolL_x(end) - SolL_x(SolL_Marker_end)]; %post < 5 

% SolL_Contribution = (SolL_trial_mean/Total_EMG_Mean)*100;
% 
% SolL_Outcomes = [SolL_pretrial_mean, SolL_trial_mean, SolL_posttrial_mean, SolL_peak, SolL_Contribution];




