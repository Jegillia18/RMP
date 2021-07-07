%% Pelvis
%time is in ms

%1=HS
%0=TO
%% Declare Variablse
Right_period = [];
Time_bin = [];
Right_Hipbin = [];
Right_Kneebin = [];
Right_Hip_norm = [];
Right_Knee_norm = [];
HL = [];
KL = [];
acost = [];
asint = [];
%% Right
Pelvis_x=Pelvis(:,1);                                                      % creates a variable for x plane data for the pelvis segment


Right_foot_x=RightFoot(:,1);                                               % creates a variable for x plane data for the foot segment
Right_foot_z=RightFoot(:,3);                                               % creates a variable for z plane data for the foot segment

Right_T=Right_foot_x-Pelvis_x;                                             % foot in relation to pelvis


Right_HS=islocalmax(Right_T,'MinProminence',.1);                           % pulls peaks of foot pevlis relational data which cooresponds to HS
Right_HS_Time = time(Right_HS);                                            % Pulls times of HS based on peaks. HS are 1 and finds corresponding time point
Right_HS_Index = index(Right_HS);                                          % Pulls discrete index locatios of HS


R_middle_25 = ceil(length(Right_HS_Index)*.25);                              % finds value for 25% of detected # of events
R_middle_50 = ceil(length(Right_HS_Index)*.75);                              % finds value for 50% of detected # of events

Right_HS_Index_mid = Right_HS_Index(R_middle_25:R_middle_50);

for i=1:length(Right_HS_Index_mid)-1                                           % Creates a variable for how much time passed during each step based on HS to HS-1
    Right_period(i) = time((Right_HS_Index_mid(i+1)-1))-time((Right_HS_Index_mid(i)));
end

period_mean = mean(Right_period);                                          % Finds the average time per step across all steps


for i=1:length(Right_HS_Index_mid)-1                                           % creates cell arrays for the times from start and end of each step
    Time_bin{i} = time(Right_HS_Index_mid(i):(Right_HS_Index_mid(i+1)-1));
end

                                                         
jRightHip = jRightHip(:,end);                                              % Pulls Z plane joint angle data

for i=1:length(Right_HS_Index_mid)-1                                           % creates cell arrays for the Hip angle from start and end of each step
    Right_Hipbin{i} = jRightHip(Right_HS_Index_mid(i):(Right_HS_Index_mid(i+1)-1));
end


jRightKnee = jRightKnee(:,end);

for i=1:length(Right_HS_Index_mid)-1                                           % creates cell arrays for the Hip angle from start and end of each step
    Right_Kneebin{i} = jRightKnee(Right_HS_Index_mid(i):Right_HS_Index_mid(i+1)-1);
end

FRM = round(mean(cellfun(@length,Right_Hipbin)));             % finds the average number of frames for all steps

for i =1:length(Time_bin)
    x = Time_bin{i}';
    T1 = x(1);
    T2 = x(end);
    T3 = T2 - T1;
    xq = T1:(T3/(FRM-1)):T2;
    v1 = Right_Hipbin{i}';
    v2 = Right_Kneebin{i}';
    
    Right_Hip_norm(:,i) = interp1(x,v1,xq,'spline')';
    Right_Knee_norm(:,i) = interp1(x,v2,xq,'spline')';

end

for i=1:FRM-1
   
    HL(i,:) = Right_Hip_norm(i+1,:)-Right_Hip_norm(i,:);
    KL(i,:) = Right_Knee_norm(i+1,:)-Right_Knee_norm(i,:);    
    
end

L = sqrt(KL.^2+HL.^2);

cost = HL./L;   % cos(theta) = x(hip)/L
sint = KL./L;   %sin(theta)= y(knee)/L

for i=1:length(cost)
    acost(i,:) = mean(cost(i,:));
    asint(i,:) = mean(sint(i,:));
end

A = sqrt(acost.^2+asint.^2);

ACC = sum(A)/FRM;
