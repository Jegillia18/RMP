%% Pelvis
%time is in ms

%1=HS
%0=TO


%% Right
Pelvis_x = Pelvis(:,1);
Right_foot_x = RightF(:,1);
Right_foot_z = RightF(:,3);

Right_T = Right_foot_x - Pelvis_x;          %foot in relation to pelvis


Right_HS=islocalmax(Right_T,'MinProminence',.1); %pulls peaks which are HS 
Right_HS_Time = time(Right_HS);                        %Pulls times of HS based on peaks. HS are 1 and finds corresponding time point     
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


%% Ankle Angle from HS to Peak
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

% 
Right = [Right_Cycle ; Right_Ankle_Event'; Right_Knee_Event'; Right_Hip_Event'; Right_Peak_Ankle ; Right_Peak_Knee];

