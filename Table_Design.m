
for x = 1:22
    app.A{x} = app.tree.data(1).jointData(x).jointAngle; %x, y z
    app.B{x} = app.tree.data(2).jointData(x).jointAngle;
    app.C{x} = app.tree.data(3).jointData(x).jointAngle; 
end

for x = 1:23
    app.D{x} = app.tree.data(1).segmentData(x).position; %x y z
    app.E{x} = app.tree.data(1).segmentData(x).position; %x y z
    app.F{x} = app.tree.data(1).segmentData(x).position; %x y z
end

% Joint Data Export
Table_1 = table(app.A{1,1}, app.A{1,2}, app.A{1,3}, app.A{1,4}, app.A{1,5}, app.A{1,6},...
     app.A{1,7}, app.A{1,8}, app.A{1,9}, app.A{1,10}, app.A{1,11}, app.A{1,12},...
     app.A{1,13}, app.A{1,14}, app.A{1,15}, app.A{1,16}, app.A{1,17}, app.A{1,18},...
     app.A{1,19}, app.A{1,20}, app.A{1,21}, app.A{1,22});
Table_1.Properties.VariableNames = {'jL5S1';'jL4L3';'jL1T12';'jT9T8';'jT1C7';...
    'jC1Head';'jRightT4Shoulder';'jRightShoulder';'jRightElbow';'jRightWrist';...
    'jLeftT4Shoulder';'jLeftShoulder';'jLeftElbow';'jLeftWrist';'jRightHip';...
    'jRightKnee';'jRightAnkle';'jRightBallFoot';'jLeftHip';'jLeftKnee';'jLeftAnkle';...
    'jLeftBallFoot'};
Table_5 = table(app.B{1,1}, app.B{1,2}, app.B{1,3}, app.B{1,4}, app.B{1,5}, app.B{1,6},...
     app.B{1,7}, app.B{1,8}, app.B{1,9}, app.B{1,10}, app.B{1,11}, app.B{1,12},...
     app.B{1,13}, app.B{1,14}, app.B{1,15}, app.B{1,16}, app.B{1,17}, app.B{1,18},...
     app.B{1,19}, app.B{1,20}, app.B{1,21}, app.B{1,22});
Table_5.Properties.VariableNames = {'jL5S1';'jL4L3';'jL1T12';'jT9T8';'jT1C7';...
    'jC1Head';'jRightT4Shoulder';'jRightShoulder';'jRightElbow';'jRightWrist';...
    'jLeftT4Shoulder';'jLeftShoulder';'jLeftElbow';'jLeftWrist';'jRightHip';...
    'jRightKnee';'jRightAnkle';'jRightBallFoot';'jLeftHip';'jLeftKnee';'jLeftAnkle';...
    'jLeftBallFoot'};
Table_6 = table(app.C{1,1}, app.C{1,2}, app.C{1,3}, app.C{1,4}, app.C{1,5}, app.C{1,6},...
     app.C{1,7}, app.C{1,8}, app.C{1,9}, app.C{1,10}, app.C{1,11}, app.C{1,12},...
     app.C{1,13}, app.C{1,14}, app.C{1,15}, app.C{1,16}, app.C{1,17}, app.C{1,18},...
     app.C{1,19}, app.C{1,20}, app.C{1,21}, app.C{1,22});
Table_6.Properties.VariableNames = {'jL5S1';'jL4L3';'jL1T12';'jT9T8';'jT1C7';...
    'jC1Head';'jRightT4Shoulder';'jRightShoulder';'jRightElbow';'jRightWrist';...
    'jLeftT4Shoulder';'jLeftShoulder';'jLeftElbow';'jLeftWrist';'jRightHip';...
    'jRightKnee';'jRightAnkle';'jRightBallFoot';'jLeftHip';'jLeftKnee';'jLeftAnkle';...
    'jLeftBallFoot'};

{'Pelvis';'L5';'L3';'T12';'T8';'Neck';'Head';'RightShoulder';'RightUpperArm';...
    'RightForeArm';'RightHand';'LeftShoulder';'LeftUpperArm';'LeftForeArm';...
    'LeftHand';'RightUpperLeg';'RightLowerLeg';'RightFoot';'RightToe';'LeftUpperLeg';...
    'LeftLowerLeg';'LeftFoot';'LeftToe'}
%Table.Properties.VariableNames = {Matrix_N};
writetable(Table_1,'Participant_1_JData.xlsx','Sheet',1); % joint Data
writetable(Table_5,'Participant_1_JData.xlsx','Sheet',2);
writetable(Table_6,'Participant_1_JData.xlsx','Sheet',3); 


