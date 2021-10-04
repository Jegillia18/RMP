% Loading in Jasmine's Data

%% Need to arrainge such that structure is p02 - Trial # - Walk # - peak ankle dorsiflexion 
clear;clc;

set = [2, 4, 5, 6, 8, 9, 13, 14, 15, 16, 18]; % alter here for participant specific ID's
% IMP: If it doesn't run - you are not in the correct folder, move to
% Jasmine_Data folder

for y = 1:length(set)
    p = set(y);
    %app.data.p = p;
    for t = 1:4
        %app.data.p.Trial = t;
       for d = 1:3
           %app.data.p.Trial.Walk = d;
           try
                tree = load_mvnx(sprintf('P0%d_T%d_WALK%d',p,t,d));
           
           catch
           end
           try
                tree = load_mvnx(sprintf('P%d_T%d_WALK%d',p,t,d));
           catch   
           end
       
            %% Read some basic data from the file
            try
            mvnxVersion = tree.metaData.mvnx_version; % version of the MVN Studio used during recording
            catch
            break
            end
            
            if (isfield(tree.metaData, 'comment'))
            fileComments = tree.metaData.comment; % comments written when saving the file
            end

            %% Read some basic properties of the subject;
            frameRate = tree.metaData.subject_frameRate;
            suitLabel = tree.metaData.subject_label;
            originalFilename = tree.metaData.subject_originalFilename;
            recDate = tree.metaData.subject_recDate;
            segmentCount = tree.metaData.subject_segmentCount;

            %% Retrieve sensor labels
            %creates a struct with sensor data
            if isfield(tree,'sensorData') && isstruct(tree.sensorData)
            sensorData = tree.sensorData;
            end

            %% Retrieve segment labels
            %creates a struct with segment definitions
            if isfield(tree,'segmentData') && isstruct(tree.segmentData)
            segmentData = tree.segmentData;
            end

            %retrieve the data frames from the subject
            nSamples = length(tree.segmentData);
   
            run('SegmentPosition.m');
            run('JointAngle.m');
            time = str2double({tree.frame.time})/1000;

            
            
%             1=HS
%             0=TO
%% Left Foot Start Here
Pelvis_x=Pelvis(:,1);

Left_foot_x = LeftF(:,1); %CHANGED NAME - Matches Left_Extraction original
Left_foot_z = LeftF(:,3); %CHANGED NAME - Matches Left_Extraction original

Left_T = Left_foot_x - Pelvis_x;   %foot in relation to pelvis


Left_HS = islocalmax(Left_T,'MinProminence',.1); %pulls peaks which are HS 
Left_HS_Time = time(Left_HS);                          %Pulls times of HS based on peaks. HS are 1 and finds corresponding time point                         
index = 1:length(time);
Left_HS_Index = index(Left_HS);


Left_TO = islocalmin(Left_T,'MinProminence',.1); %pulls troughs which are TO 
Left_TO_Time = time(Left_TO);                          %Pulls times of TO based on troughs. TO are 1 and finds corresponding time point
Left_TO_Index = index(Left_TO);

while length(Left_HS_Time) ~= length(Left_TO_Time)  %Correcting unmatched TO or HS
if length(Left_HS_Time) > length(Left_TO_Time)
    Left_HS_Time(end) = [];
    Left_HS_Index(end) = [];    
    
elseif length(Left_TO_Time) > length(Left_HS_Time)
    Left_TO_Time(end) = [];
    Left_TO_Index(end) = [];
   
end
end


% Ankle Angle from HS to Peak
Left_Ankle = jLeftAnkle(:,3);
% Left_Ankle_TO = Left_Ankle(Left_TO);
% Left_Ankle_HS = Left_Ankle(Left_HS);

Left_Knee = jLeftKnee(:,3);
% Left_Knee_TO = Left_Knee(Left_TO);
% Left_Knee_HS = Left_Knee(Left_HS);

Left_Hip = jLeftHip(:,3);

Left_HS_Time = Left_HS_Time';
Left_HS_Time(2,1:length(Left_HS_Time)) = 1;                                %Marks HS as 1 so I can keep track of events
Left_HS = [Left_HS_Time; Left_HS_Index];


Left_TO_Time = Left_TO_Time';
Left_TO_Time(2,1:length(Left_TO_Time)) = 0;                                %Marks TO as 0 so I can keep track of events
Left_TO = [Left_TO_Time; Left_TO_Index];


Left_Cycle1 = [Left_HS Left_TO];                                 %Creates an array with all the events of interests


[temp, order] = sort(Left_Cycle1(1,:) ,'ascend');                          %Sorts evetns in chronological order
Left_Cycle2 = Left_Cycle1(:,order);                                        %Sorts evetns in chronological order                            


L_middle_25 = floor(length(Left_Cycle2)*.25);                              % finds value for 25% of detected # of events
L_middle_50 = floor(length(Left_Cycle2)*.50);                              % finds value for 50% of detected # of events


L_Start = L_middle_25+1;                                                   % Value that cuts off the first 25% adn start at the next point (+1)

Left_Cycle2 = Left_Cycle2(1:end,L_Start:end);                              % Performs first 25% cut off

if Left_Cycle2(2,1) == 0                                                   %Checks to see if first event is TO. If yes go to next point
    Left_Cycle2(:,1) = [];
end

Left_Cycle = Left_Cycle2(1:end,1:L_middle_50);                             %Pulls data starting at new first point through the amount of points that is equal to 50% of the # number of events detected.

Left_Angle_Event_Finder = Left_Cycle(3,1:end)+1;             % need to add 1 when looking into the joint data to make up for miss alignment of indexes when it is pulled into a single variable




Left_Ankle_Event = Left_Ankle(Left_Angle_Event_Finder);                 %Ankle angle at toe off and IC from Left Cycle variable

Left_Knee_Event = Left_Knee(Left_Angle_Event_Finder);                   %Knee angle at toe off and IC from Left Cycle variable                 

Left_Hip_Event = Left_Hip(Left_Angle_Event_Finder);                     %Hip angle at toe off and IC from Left Cycle variable
                   

for i=1:length(Left_Angle_Event_Finder)-1
[Left_Peak_Ankle(i) LPA_I(i)] = max(Left_Ankle(Left_Angle_Event_Finder(i):Left_Angle_Event_Finder(i+1)));

[Left_Peak_Knee(i) LKA_I(i)] = max(Left_Knee(Left_Angle_Event_Finder(i):Left_Angle_Event_Finder(i+1)));

end

NA_Fill = [nan; nan; nan]; %blank array to use as a fill for the inbetween variables that will be one less then the number of steps



LPA_Knee = Left_Knee(LPA_I);                                              %knee angle at peak ankle
LPA_Hip = Left_Hip(LPA_I);                                                %hip angle at peak ankle
Left_Peak_Ankle = [Left_Peak_Ankle; LPA_Knee'; LPA_Hip'];                %combining ankle, knee, and hip angle at Left peak ankle to one variable
Left_Peak_Ankle = [Left_Peak_Ankle NA_Fill];                             %adding the fill variable to even out arrays

LKA_Ankle = Left_Ankle(LKA_I);                                            %ankle angle at peak knee
LKA_Hip = Left_Hip(LKA_I);                                                %hip angle at peak knee
Left_Peak_Knee = [Left_Peak_Knee; LKA_Ankle'; LKA_Hip'];        %combining ankle, knee, and hip angle at Left peak knee to one variable
Left_Peak_Knee = [Left_Peak_Knee NA_Fill];                               %adding the fill variable to even out arrays

% 
Left = [Left_Cycle ; Left_Ankle_Event'; Left_Knee_Event'; Left_Hip_Event'; Left_Peak_Ankle ; Left_Peak_Knee];
               
               
%% Right Foot Start Here
Pelvis_x = Pelvis(:,1);
Right_foot_x = RightF(:,1);
Right_foot_z = RightF(:,3);

Right_T = Right_foot_x - Pelvis_x;          %foot in relation to pelvis


Right_HS=islocalmax(Right_T,'MinProminence',.1); %pulls peaks which are HS 
Right_HS_Time = time(Right_HS);                        %Pulls times of HS based on peaks. HS are 1 and finds corresponding time point     
index = 1:length(time);
Right_HS_Index = index(Right_HS);


Right_TO = islocalmin(Right_T,'MinProminence',.1); %pulls troughs which are TO
Right_TO_Time = time(Right_TO);                          %Pulls times of TO based on troughs. TO are 1 and finds corresponding time point
Right_TO_Index = index(Right_TO);

while length(Right_HS_Time) ~= length(Right_TO_Time) %Correcting unmatched TO or HS
if length(Right_HS_Time) > length(Right_TO_Time)
    Right_HS_Time(end) = [];
    Right_HS_Index(end) = [];
     
elseif length(Right_TO_Time) > length(Right_HS_Time)
    Right_TO_Time(end) = [];
    Right_TO_Index(end) = [];
end
end


% Ankle Angle from HS to Peak
Right_Ankle = jRightAnkle(:,3);
% Right_Ankle_TO = Right_Ankle(Right_TO);
% Right_Ankle_HS = Right_Ankle(Right_HS);

Right_Knee = jRightKnee(:,3);
% Right_Knee_TO = Right_Knee(Right_TO);
% Right_Knee_HS = Right_Knee(Right_HS);

Right_Hip = jRightHip(:,3);



Right_HS_Time = Right_HS_Time';
Right_HS_Time(2,1:length(Right_HS_Time)) = 1;                              %Marks HS as 1 so I can keep track of events
Right_HS = [Right_HS_Time; Right_HS_Index];

Right_TO_Time = Right_TO_Time';
Right_TO_Time(2,1:length(Right_TO_Time)) = 0;                              %Marks TO as 0 so I can keep track of events
Right_TO = [Right_TO_Time; Right_TO_Index];

Right_Cycle1 = [Right_HS Right_TO];                               %Creates an array with all the events of interests


[temp, order] = sort(Right_Cycle1(1,:) ,'ascend');                         %Sorts evetns in chronological order
Right_Cycle2 = Right_Cycle1(:,order);                                      %Sorts evetns in chronological order                            


R_middle_25 = floor(length(Right_Cycle2)*.25);                             % finds value for 25% of detected # of events
R_middle_50 = floor(length(Right_Cycle2)*.50);                             % finds value for 50% of detected # of events


R_Start = R_middle_25+1;                                                   % Value that cuts off the first 25% adn start at the next point (+1)

Right_Cycle2 = Right_Cycle2(1:end,R_Start:end);                            % Performs first 25% cut off

if Right_Cycle2(2,1) == 0                                                  %Checks to see if first event is TO. If yes go to next point
    Right_Cycle2(:,1) = [];
end

Right_Cycle = Right_Cycle2(1:end,1:R_middle_50);                           %Pulls data starting at new first point through the amount of points that is equal to 50% of the # number of events detected.

Right_Angle_Event_Finder = Right_Cycle(3,1:end)+1;     %need index to find in between values        % need to add 1 when looking into the joint data to make up for miss alignment of indexes when it is pulled into a single variable


Right_Ankle_Event = Right_Ankle(Right_Angle_Event_Finder);                 %Ankle angle at toe off and IC from Right Cycle variable

Right_Knee_Event = Right_Knee(Right_Angle_Event_Finder);                   %Knee angle at toe off and IC from Right Cycle variable                 

Right_Hip_Event = Right_Hip(Right_Angle_Event_Finder);                     %Hip angle at toe off and IC from Right Cycle variable
                   

for i=1:length(Right_Angle_Event_Finder)-1
[Right_Peak_Ankle(i) RPA_I(i)] = max(Right_Ankle(Right_Angle_Event_Finder(i):Right_Angle_Event_Finder(i+1)));

[Right_Peak_Knee(i) RKA_I(i)] = max(Right_Knee(Right_Angle_Event_Finder(i):Right_Angle_Event_Finder(i+1)));

end

NA_Fill = [nan; nan; nan]; %blank array to use as a fill for the inbetween variables that will be one less then the number of steps



RPA_Knee = Right_Knee(RPA_I);                                              %knee angle at peak ankle
RPA_Hip = Right_Hip(RPA_I);                                                %hip angle at peak ankle
Right_Peak_Ankle = [Right_Peak_Ankle; RPA_Knee'; RPA_Hip'];                %combining ankle, knee, and hip angle at right peak ankle to one variable
Right_Peak_Ankle = [Right_Peak_Ankle NA_Fill];                             %adding the fill variable to even out arrays

RKA_Ankle = Right_Ankle(RKA_I);                                            %ankle angle at peak knee
RKA_Hip = Right_Hip(RKA_I);                                                %hip angle at peak knee
Right_Peak_Knee = [Right_Peak_Knee; RKA_Ankle'; RKA_Hip';];        %combining ankle, knee, and hip angle at right peak knee to one variable
Right_Peak_Knee = [Right_Peak_Knee NA_Fill];                               %adding the fill variable to even out arrays


Right = [Right_Cycle ; Right_Ankle_Event'; Right_Knee_Event'; Right_Hip_Event'; Right_Peak_Ankle ; Right_Peak_Knee];


%% Data Saved Here: Dorsiflexion angle during swing phase for middle 50%


data.(['Participant_',num2str(p),]).(['Trial_', num2str(t),]).(['WALK_', num2str(d),]).L = table(Left_Peak_Ankle); 

data.(['Participant_',num2str(p),]).(['Trial_', num2str(t),]).(['WALK_', num2str(d),]).R = table(Right_Peak_Ankle);


clearvars -except p t set d y data 



       end
    end
end
           
           
