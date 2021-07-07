%% Pelvis
%time is in ms

%1=HS
%0=TO
%% Declare Variablse
Left_period = [];
Time_bin = [];
Left_Hipbin = [];
Left_Kneebin = [];
Left_Hip_norm = [];
Left_Knee_norm = [];
HL = [];
KL = [];
acost = [];
asint = [];

%% Left Foot
Pelvis_x=Pelvis(:,1);

Left_foot_x = LeftFoot(:,1);
Left_foot_z = LeftFoot(:,3);

Left_T = Left_foot_x-Pelvis_x;   %foot in relation to pelvis


Left_HS = islocalmax(Left_T,'MinProminence',.1); %pulls peaks which are HS 
Left_HS_Time = time(Left_HS);                          %Pulls times of HS based on peaks. HS are 1 and finds corresponding time point                         
Left_HS_Index = index(Left_HS);

L_middle_25 = ceil(length(Left_HS_Index)*.25);                              % finds value for 25% of detected # of events
L_middle_50 = ceil(length(Left_HS_Index)*.75);                              % finds value for 50% of detected # of events

Left_HS_Index_mid = Left_HS_Index(L_middle_25:L_middle_50);


for i=1:length(Left_HS_Index_mid)-1                                           % Creates a variable for how much time passed during each step based on HS to HS-1
    Left_period(i) = time((Left_HS_Index_mid(i+1)-1))-time((Left_HS_Index_mid(i)));
end

period_mean = mean(Left_period);                                          % Finds the average time per step across all steps


for i=1:length(Left_HS_Index_mid)-1                                           % creates cell arrays for the times from start and end of each step
    Time_bin{i} = time(Left_HS_Index_mid(i):(Left_HS_Index_mid(i+1)-1));
end

                                                         
jLeftHip = jLeftHip(:,end);                                              % Pulls Z plane joint angle data

for i=1:length(Left_HS_Index_mid)-1                                           % creates cell arrays for the Hip angle from start and end of each step
    Left_Hipbin{i} = jLeftHip(Left_HS_Index_mid(i):(Left_HS_Index_mid(i+1)-1));
end


jLeftKnee = jLeftKnee(:,end);

for i=1:length(Left_HS_Index_mid)-1                                           % creates cell arrays for the Hip angle from start and end of each step
    Left_Kneebin{i} = jLeftKnee(Left_HS_Index_mid(i):Left_HS_Index_mid(i+1)-1);
end

FRM = round(mean(cellfun(@length,Left_Hipbin)));             % finds the average number of frames for all steps

for i =1:length(Time_bin)
    x = Time_bin{i}';
    T1 = x(1);
    T2 = x(end);
    T3 = T2 - T1;
    xq = T1:(T3/(FRM-1)):T2;
    v1 = Left_Hipbin{i}';
    v2 = Left_Kneebin{i}';
    
    Left_Hip_norm(:,i) = interp1(x,v1,xq,'spline')';
    Left_Knee_norm(:,i) = interp1(x,v2,xq,'spline')';

end

for i=1:FRM-1
   
    HL(i,:) = Left_Hip_norm(i+1,:)-Left_Hip_norm(i,:);
    KL(i,:) = Left_Knee_norm(i+1,:)-Left_Knee_norm(i,:);    
    
end

%x = hip
%y = knee


L = sqrt(KL.^2+HL.^2);
cost = HL./L;   % cos(theta) = x(hip)/L
sint = KL./L;   %sin(theta)= y(knee)/L

for i=1:length(cost)
    acost(i,:) = mean(cost(i,:));
    asint(i,:) = mean(sint(i,:));
end

A = sqrt(acost.^2+asint.^2);

ACC = sum(A)/FRM;

