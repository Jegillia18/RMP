%% Pelvis
%time is in ms

%1=HS
%0=TO

Pelvis_x=Pelvis(:,1);
%% Left Foot
Left_foot_x = LeftFoot(:,1);
Left_foot_z = LeftFoot(:,3);

Left_T = Left_foot_x-Pelvis_x;   %foot in relation to pelvis


Left_HS = islocalmax(Left_T,'MinProminence',.1); %pulls peaks which are HS 
Left_HS_Time = time(Left_HS);                          %Pulls times of HS based on peaks. HS are 1 and finds corresponding time point                         
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


%% Ankle Angle from HS to Peak
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
 
