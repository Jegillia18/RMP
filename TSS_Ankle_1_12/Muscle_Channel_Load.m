%% Trial 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
warning off
participants = [2 4 5 6 8 9 10 13 14 15 16 18];
Data = [];

for i=1:length(participants)
    p = participants(i);
     for t =1:4
         
      Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).('Soleus') = table();
      Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).('Tibialis_Anterior') = table();
        
        for s = 1:6
           
            %cd 'C:\Users\cazmo\Documents\Rainmeter\Skins\Droptop Folders\Bookmarks\Subclinical EMG Analysis (1)\subclinical EMG individual trials'
         
        try       
Pre_file = load(sprintf('WFL_696_P0%d_T%d_DF%d',p,t,s));   
        catch 
Pre_file = load(sprintf('WFL_696_P%d_T%d_DF%d',p,t,s));  
        end
        
%Pre_file.(['Participant_',(num2str(p)),]).(['Session_',(num2str(s)),])= load(sprintf('WFL_696_P0%d_T%d_DF%d',p,t,s));

Pre_Name = fieldnames(Pre_file);                                       
%Pre_Name = Pre_Name{3};
% 
%% Marker
Marker_Name = fieldnames(Pre_file);
Marker_Name = Marker_Name{10};

Marker_x = Pre_file.(Marker_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
Marker_y = Pre_file.(Marker_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sol Right EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SolL_Name = fieldnames(Pre_file);
SolL_Name = SolL_Name{6};

SolL_x = Pre_file.(SolL_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
SolL_y = Pre_file.(SolL_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%% %% Sol Left EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SolR_Name = fieldnames(Pre_file);
SolR_Name = SolR_Name{7};

SolR_x = Pre_file.(SolR_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
SolR_y = Pre_file.(SolR_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sol Right EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TAL_Name = fieldnames(Pre_file);
TAL_Name = TAL_Name{8};%8

TAL_x = Pre_file.(TAL_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
TAL_y = Pre_file.(TAL_Name).values;                                  %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%% %% Sol Left EMG for First Trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TAR_Name = fieldnames(Pre_file);
TAR_Name = TAR_Name{9};%9

TAR_x = Pre_file.(TAR_Name).times;                                   %Saves the time axis from the Bicep data to a variable, labeled with x for axis it should be plotted on.
TAR_y = Pre_file.(TAR_Name).values;                                      %Saves the bicep data for the elbow to a variable, labeled with y for axis it should be plotted on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

%% 
 %cd 'C:\Users\cazmo\Documents\Rainmeter\Skins\Droptop Folders\Bookmarks\Subclinical EMG Analysis (1)\Subclinical EMG Analysis\Method 4'
 
% plot(Marker_x,Marker_y)
% title(Marker_Name)
% pause
% figure
  
 
 
 run('Marker_Finder');
 run('SolL');
 run('SolR');
 run('TAL');
 run('TAR');

% Times = [Bicep_Onset; Finger_Onset; Hypothenar_Onset; Thenar_Onset; Tricep_Onset; WristEx_Onset; WristFl_Onset];
% Times = [Hypothenar_Onset; Thenar_Onset; WristEx_Onset];
% Marker_Times = [Marker_start_time Marker_end_time];


% Bicep_Marker = SolL_x(Bicep3_Marker_ind);
% Bicep_Marker_End = SolL_x(Bicep3_Marker_end);
% [Bicep_peak, Bicep_peak_ind] = max(Bicep3_y(Bicep3_Marker_ind:Bicep3_Marker_end-1));
% Bicep_T2P = SolL_x((Bicep3_Marker_ind+Bicep_peak_ind)-1);
% Bicep_Times = [Bicep_Marker; Bicep_Marker_End; Bicep_Onset; Bicep_T2P; Bicep_FMO; Bicep_Offset];
% Bicep_BL = [Bicep3_baseline_avg; Bicep3_STD];




%Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).('Soleus_Right') = table();
if (s == 1)||(s == 2)||(s == 3)
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Trail')(s,1) = convertCharsToStrings(['Trial_Left_',num2str(s),]);
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Peak_EMG')(s,1) = SolL_peak;%; SolL_mean; SolL_T2P];
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Average_EMG')(s,1) = SolL_mean;
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Time_to_Peak')(s,1) = SolL_T2P;

Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Trail')(s,1) = convertCharsToStrings(['Trial_Left_',num2str(s),]);
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Peak_EMG')(s,1) = TAL_peak;%; SolL_mean; SolL_T2P];
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Average_EMG')(s,1) = TAL_mean;
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Time_to_Peak')(s,1) = TAL_T2P;


elseif (s == 4)||(s == 5)||(s == 6)
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Trail')(s,1) = convertCharsToStrings(['Trial_Right_',num2str(s),]);
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Peak_EMG')(s,1) = SolR_peak;%; SolL_mean; SolL_T2P];
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Average_EMG')(s,1) = SolR_mean;
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Soleus.('Time_to_Peak')(s,1) = SolR_T2P;

Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Trail')(s,1) = convertCharsToStrings(['Trial_Right_',num2str(s),]);
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Peak_EMG')(s,1) = TAR_peak;%; SolL_mean; SolL_T2P];
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Average_EMG')(s,1) = TAR_mean;
Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).Tibialis_Anterior.('Time_to_Peak')(s,1) = TAR_T2P;
end
          

%Data.(['Participant_',num2str(p),]).(['Session_', num2str(t),]).SolLeft(s,1) = SolL_mean
% 
% Data.Sol.Right.PeakEMG = SolR_peak;
% Data.TA.Left.PeakEMG = TAL_peak;
% Data.TA.Right.PeakEMG = TAR_peak;
% 
% Data.Sol.Left.MeanEMG = SolL_mean;
% Data.Sol.Right.MeankEMG = SolR_mean;
% Data.TA.Left.MeanEMG = TAL_mean;
% Data.TA.Right.MeanEMG = TAR_mean;
% 
% Data.Sol.Left.TimetoPeak = SolL_T2P;
% Data.Sol.Right.TimetoPeak = SolR_T2P;
% Data.TA.Left.TimetoPeak = TAL_T2P;
% Data.TA.Right.TimetoPeak = TAR_T2P;



% Total_EMG_Mean = Thenar_trial_mean + Hypothenar_trial_mean + Finger_trial_mean + WristEx_trial_mean + WristFl_trial_mean + Tricep_trial_mean + Bicep_trial_mean;
% 
%Peaks = [Thenar_T2P, Hypothenar_T2P, Finger_T2P, WristEx_T2P, WristFl_T2P, Tricep_T2P, Bicep_T2P];


% Offset = [Offset_Times FMO_Times];

%Outcomes(i,:) = [p; Thenar_BL; Hypothenar_BL; Finger_BL; WristEx_BL; WristFl_BL; Tricep_BL; Bicep_BL];

% if s == 1
%     s1 = [EMG_MARKER_TIMES; EMG_MARKER_OFFTIMES; Onset_Times; NaN; Offset_Times; FMO_Times];
% elseif s == 2
%     s2 = [EMG_MARKER_TIMES; EMG_MARKER_OFFTIMES; Onset_Times; NaN; Offset_Times; FMO_Times];
% elseif s == 3
%     s3 = [EMG_MARKER_TIMES; EMG_MARKER_OFFTIMES; Onset_Times; NaN; Offset_Times; FMO_Times];
% end
%clearvars -except s1 s2 s3 participants t s p l Outcomes
%close all
        end
% %         
%  DATA_1(l,:) = [s1];
%   DATA_2(l,:) = [s2];
%   DATA_3(l,:) = [s3];
    end
end
