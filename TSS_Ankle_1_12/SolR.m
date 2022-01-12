%% 
%%%%%%%%%%%%%%%%%%%%%need to conert everything to muscle ind. prob easier
%%%%%%%%%%%%%%%%%%%%%to make functions
[~, SolR_Marker_ind] =  min(abs(SolR_x - Marker_start_time));  % finding the nearest corresponding time from SolR time domain to Elbow time domain

[~, SolR_Marker_end] =  min(abs(SolR_x - Marker_end_time)); 

[~, SolR_Pre] =  min(abs(SolR_x - TFx_pre)); %this used to be SolR1_x i think i messed up, its just time should be fine
%SolR_trial = SolR1_x(SolR_Marker_ind);
[~, SolR_post] =  min(abs(SolR_x - TFx_post));

SolR_STD = std(SolR_y(SolR_Pre-1:SolR_Marker_ind-1));
SolR_baseline_avg = mean(SolR_y(SolR_Pre-1:SolR_Marker_ind-1));
SolR_SD = SolR_baseline_avg + (SolR_STD*3);


for i = SolR_Marker_ind:SolR_Marker_end
if SolR_y(i) > SolR_SD && SolR_y(i+1) > SolR_SD && SolR_y(i+2) > SolR_SD && SolR_y(i+3) > SolR_SD && SolR_y(i+4) > SolR_SD && SolR_y(i+5) > SolR_SD && SolR_y(i+6) > SolR_SD...
        && SolR_y(i+7) > SolR_SD && SolR_y(i+8) > SolR_SD && SolR_y(i+9) > SolR_SD && SolR_y(i+10) > SolR_SD...
        && SolR_y(i+11) > SolR_SD && SolR_y(i+12) > SolR_SD && SolR_y(i+13) > SolR_SD && SolR_y(i+14) > SolR_SD...
        && SolR_y(i+15) > SolR_SD && SolR_y(i+16) > SolR_SD && SolR_y(i+17) > SolR_SD && SolR_y(i+18) > SolR_SD...
        && SolR_y(i+19) > SolR_SD && SolR_y(i+20) > SolR_SD...
        && SolR_y(i+21) > SolR_SD && SolR_y(i+22) > SolR_SD && SolR_y(i+23) > SolR_SD && SolR_y(i+24) > SolR_SD...
        && SolR_y(i+25) > SolR_SD && SolR_y(i+26) > SolR_SD && SolR_y(i+27) > SolR_SD && SolR_y(i+28) > SolR_SD...
        && SolR_y(i+29) > SolR_SD && SolR_y(i+30) > SolR_SD && SolR_y(i+31) > SolR_SD && SolR_y(i+32) > SolR_SD...
        && SolR_y(i+33) > SolR_SD && SolR_y(i+34) > SolR_SD && SolR_y(i+35) > SolR_SD && SolR_y(i+36) > SolR_SD...
        && SolR_y(i+37) > SolR_SD && SolR_y(i+38) > SolR_SD && SolR_y(i+39) > SolR_SD && SolR_y(i+40) > SolR_SD...
        && SolR_y(i+41) > SolR_SD && SolR_y(i+42) > SolR_SD && SolR_y(i+43) > SolR_SD && SolR_y(i+44) > SolR_SD...
        && SolR_y(i+45) > SolR_SD && SolR_y(i+46) > SolR_SD && SolR_y(i+47) > SolR_SD && SolR_y(i+48) > SolR_SD...
        && SolR_y(i+49) > SolR_SD
   
   
    SolR_Onset_Index = i;
    break
else 
    SolR_Onset_Index = NaN;
end
end

if ~isnan(SolR_Onset_Index)
SolR_onset_time = SolR_x(SolR_Onset_Index);   %putting it in SolR time domain
else
    SolR_onset_time = NaN;
%[~, SolR_trial] =  min(abs(Elbow - SolR_trial));  % finding the nearest corresponding time from SolR time domain to Elbow time domain
end
% if length(SolR_trial) ~= 1
%   SolR_trial(2) = [];
% end
% SolR_Onset = [SolR1_onset_time; SolR2_onset_time; SolR_onset_time];

SolR_Onset = SolR_onset_time;
try
    SolR_Onset_Value = SolR_y(SolR_Onset_Index);
catch
    SolR_Onset_Value = NaN;
end
%% Offset

 if isnan(SolR_Onset_Index) 
    SolR_Offset_Index = Inf;
    SolR_Offset_time = Inf;
%     break
 else
for i = SolR_Onset_Index:SolR_Marker_end

if SolR_y(i) < SolR_SD && SolR_y(i+1) < SolR_SD && SolR_y(i+2) < SolR_SD && SolR_y(i+3) < SolR_SD && SolR_y(i+4) < SolR_SD && SolR_y(i+5) < SolR_SD && SolR_y(i+6) < SolR_SD...
        && SolR_y(i+7) < SolR_SD && SolR_y(i+8) < SolR_SD && SolR_y(i+9) < SolR_SD && SolR_y(i+10) < SolR_SD...
        && SolR_y(i+11) < SolR_SD && SolR_y(i+12) < SolR_SD && SolR_y(i+13) < SolR_SD && SolR_y(i+14) < SolR_SD...
        && SolR_y(i+15) < SolR_SD && SolR_y(i+16) < SolR_SD && SolR_y(i+17) < SolR_SD && SolR_y(i+18) < SolR_SD...
        && SolR_y(i+19) < SolR_SD && SolR_y(i+20) < SolR_SD...
        && SolR_y(i+21) < SolR_SD && SolR_y(i+22) < SolR_SD && SolR_y(i+23) < SolR_SD && SolR_y(i+24) < SolR_SD...
        && SolR_y(i+25) < SolR_SD && SolR_y(i+26) < SolR_SD && SolR_y(i+27) < SolR_SD && SolR_y(i+28) < SolR_SD...
        && SolR_y(i+29) < SolR_SD && SolR_y(i+30) < SolR_SD && SolR_y(i+31) < SolR_SD && SolR_y(i+32) < SolR_SD...
        && SolR_y(i+33) < SolR_SD && SolR_y(i+34) < SolR_SD && SolR_y(i+35) < SolR_SD && SolR_y(i+36) < SolR_SD...
        && SolR_y(i+37) < SolR_SD && SolR_y(i+38) < SolR_SD && SolR_y(i+39) < SolR_SD && SolR_y(i+40) < SolR_SD...
        && SolR_y(i+41) < SolR_SD && SolR_y(i+42) < SolR_SD && SolR_y(i+43) < SolR_SD && SolR_y(i+44) < SolR_SD...
        && SolR_y(i+45) < SolR_SD && SolR_y(i+46) < SolR_SD && SolR_y(i+47) < SolR_SD && SolR_y(i+48) < SolR_SD...
        && SolR_y(i+49) < SolR_SD 
    
    
    
    SolR_Offset_Index = i;
    break
else 
    SolR_Offset_Index = NaN;
end
 end
 
 if ~isnan(SolR_Offset_Index)
SolR_Offset_time = SolR_x(SolR_Offset_Index);   %putting it in SolR time domain
else
    SolR_Offset_time = NaN;
%[~, SolR_trial] =  min(abs(Elbow - SolR_trial));  % finding the nearest corresponding time from SolR time domain to Elbow time domain
 end
end

% SolR_Offset = [SolR1_Offset_time; SolR2_Offset_time; SolR_Offset_time];
SolR_Offset = SolR_Offset_time;
try
    SolR_Offset_Value = SolR_y(SolR_Offset_Index);
catch
    solR_Offset_Value = NaN;
end
%% Offset from Marker

if isnan(SolR_Onset_Index) 
    SolR_FMO_Index = Inf;
    SolR_FMO_time = Inf;
%     break
 else
try
for i = SolR_Marker_end:(length(SolR_y)-20)


if SolR_y(i) < SolR_SD && SolR_y(i+1) < SolR_SD && SolR_y(i+2) < SolR_SD && SolR_y(i+3) < SolR_SD && SolR_y(i+4) < SolR_SD && SolR_y(i+5) < SolR_SD && SolR_y(i+6) < SolR_SD...
        && SolR_y(i+7) < SolR_SD && SolR_y(i+8) < SolR_SD && SolR_y(i+9) < SolR_SD && SolR_y(i+10) < SolR_SD...
        && SolR_y(i+11) < SolR_SD && SolR_y(i+12) < SolR_SD && SolR_y(i+13) < SolR_SD && SolR_y(i+14) < SolR_SD...
        && SolR_y(i+15) < SolR_SD && SolR_y(i+16) < SolR_SD && SolR_y(i+17) < SolR_SD && SolR_y(i+18) < SolR_SD...
        && SolR_y(i+19) < SolR_SD && SolR_y(i+20) < SolR_SD...
        && SolR_y(i+21) < SolR_SD && SolR_y(i+22) < SolR_SD && SolR_y(i+23) < SolR_SD && SolR_y(i+24) < SolR_SD...
        && SolR_y(i+25) < SolR_SD && SolR_y(i+26) < SolR_SD && SolR_y(i+27) < SolR_SD && SolR_y(i+28) < SolR_SD...
        && SolR_y(i+29) < SolR_SD && SolR_y(i+30) < SolR_SD && SolR_y(i+31) < SolR_SD && SolR_y(i+32) < SolR_SD...
        && SolR_y(i+33) < SolR_SD && SolR_y(i+34) < SolR_SD && SolR_y(i+35) < SolR_SD && SolR_y(i+36) < SolR_SD...
        && SolR_y(i+37) < SolR_SD && SolR_y(i+38) < SolR_SD && SolR_y(i+39) < SolR_SD && SolR_y(i+40) < SolR_SD...
        && SolR_y(i+41) < SolR_SD && SolR_y(i+42) < SolR_SD && SolR_y(i+43) < SolR_SD && SolR_y(i+44) < SolR_SD...
        && SolR_y(i+45) < SolR_SD && SolR_y(i+46) < SolR_SD && SolR_y(i+47) < SolR_SD && SolR_y(i+48) < SolR_SD...
        && SolR_y(i+49) < SolR_SD 
    
    
    SolR_FMO_Index = i;
    break
else 
    SolR_FMO_Index = NaN;
end
 end
 catch
 SolR_FMO_Index = NaN;
end

 if ~isnan(SolR_FMO_Index)
SolR_FMO_time = SolR_x(SolR_FMO_Index);   %putting it in SolR time domain
else
    SolR_FMO_time = NaN;
%[~, SolR_trial] =  min(abs(Elbow - SolR_trial));  % finding the nearest corresponding time from SolR time domain to Elbow time domain
 end
end


% SolR_FMO = [SolR1_FMO_time; SolR2_FMO_time; SolR_FMO_time];
SolR_FMO = SolR_FMO_time;



%% SolR From Marker Times Code
% [~, SolR_Marker_ind] =  min(abs(SolR_x - Marker_start_time));  % finding the nearest corresponding time from SolR time domain to Elbow time domain
% 
% [~, SolR_Marker_end] =  min(abs(SolR_x - Marker_end_time)); 
% 
% [~, SolR_pre] =  min(abs(SolR_x - TFx_pre));

% [~, SolR_post] =  min(abs(SolR_x - TFx_post));

SolR_mean = mean(SolR_y(SolR_Marker_ind:SolR_Marker_end-1));

[SolR_peak, SolR_peak_ind] = max(SolR_y(SolR_Marker_ind:SolR_Marker_end-1));

SolR_peak_ind = (SolR_peak_ind + SolR_Marker_ind)-1;

SolR_T2P = SolR_x(SolR_peak_ind) - SolR_x(SolR_Marker_ind);


% SolR_trial_mean = mean(SolR_y(SolR_Marker_ind:SolR_Marker_end-1));
% 
% SolR_pretrial_mean = mean(SolR_y(SolR_Marker_ind-dur:SolR_Marker_ind-1));
% 
% %SolR_pretrial_mean = mean(SolR_y(1:SolR_Marker_ind-1)); %to use when not 5 sec pre
% 
% SolR_posttrial_mean = mean(SolR_y(SolR_Marker_end:SolR_Marker_end+dur-1));
% 
% %SolR_posttrial_mean = mean(SolR_y(SolR_Marker_end:end)); %to use when not 5 sec post
% 
% [SolR_peak, SolR_peak_ind] = max(SolR_y(SolR_Marker_ind:SolR_Marker_end-1));
% 
% 
% 
%  SolR_trial_time = (SolR_x(SolR_Marker_end) - SolR_x(SolR_Marker_ind));
% 
% %SolR_times = [(SolR_x(SolR_Marker_ind) - SolR_x(1)),SolR_trial_time, (SolR_x(SolR_Marker_end+dur-1)- SolR_x(SolR_Marker_end))]; %pre < 5 
% 
% SolR_times = [(SolR_x(SolR_Marker_ind-1)- SolR_x(SolR_Marker_ind-dur)),SolR_trial_time, SolR_x(end) - SolR_x(SolR_Marker_end)]; %post < 5 

% SolR_Contribution = (SolR_trial_mean/Total_EMG_Mean)*100;
% 
% SolR_Outcomes = [SolR_pretrial_mean, SolR_trial_mean, SolR_posttrial_mean, SolR_peak, SolR_Contribution];




