%% Joint Angle Extraction
% 22 joints
 
    jL5S1 = tree.jointData(1).jointAngle;    %X,Y,Z  
 
    jL4L3 = tree.jointData(2).jointAngle;    %X,Y,Z
    
    jL1T12 = tree.jointData(3).jointAngle;    %X,Y,Z
   
    jT9T8 = tree.jointData(4).jointAngle;    %X,Y,Z 
   
    jT1C7 = tree.jointData(5).jointAngle;    %X,Y,Z 
  
    jC1Head = tree.jointData(6).jointAngle;    %X,Y,Z
 
    jRightT4Shoulder = tree.jointData(7).jointAngle;    %X,Y,Z 
 
    jRightShoulder = tree.jointData(8).jointAngle;    %X,Y,Z
  
    jRightElbow = tree.jointData(9).jointAngle;    %X,Y,Z 
   
    jRightWrist = tree.jointData(10).jointAngle;    %X,Y,Z 
  
    jLeftT4Shoulder = tree.jointData(11).jointAngle;    %X,Y,Z 
    
    jLeftShoulder = tree.jointData(12).jointAngle;    %X,Y,Z 
    
    jLeftElbow = tree.jointData(13).jointAngle;    %X,Y,Z 
    
    jLeftWrist = tree.jointData(14).jointAngle;    %X,Y,Z 
    
    jRightHip = tree.jointData(15).jointAngle;    %X,Y,Z 
    
    jRightKnee = tree.jointData(16).jointAngle;    %X,Y,Z 
    
    jRightAnkle = tree.jointData(17).jointAngle;    %X,Y,Z 
    
    jRightBallFoot = tree.jointData(18).jointAngle;    %X,Y,Z 
    
    jLeftHip = tree.jointData(19).jointAngle;    %X,Y,Z 
    
    jLeftKnee = tree.jointData(20).jointAngle;    %X,Y,Z
   
    jLeftAnkle = tree.jointData(21).jointAngle;    %X,Y,Z
    
    jLeftBallFoot = tree.jointData(22).jointAngle;    %X,Y,Z
   

% %% %% Organize Data in Excel
% %Creates Table of All the joint names, not neccesary but could be useful
% JointNames={'jL5S1','jL4L3','jL1T12','jT9T8','jT1C7','jC1Head','jRightT4Shoulder','jRightShoulder','jRightElbow','jRightWrist','jLeftT4Shoulder','jLeftShoulder','jLeftElbow','jLeftWrist','jRightHip','jRightKnee','jRightAnkle','jRightBallFoot','jLeftHip','jLeftKnee','jLeftAnkle','jLeftBallFoot'};
% 
% %Copies Joint Data to Excel into seperate sheets
% %NOTE: xlswrite function will rewrite over specified excel file each time
% %it runs
% filename = 'JointAngleData.xlsx';
% xlswrite(filename,jL5S1,1);
% xlswrite(filename,jL4L3,2);
% xlswrite(filename,jL1T12,3);
% xlswrite(filename,jT9T8,4);
% xlswrite(filename,jT1C7,5);
% xlswrite(filename,jC1Head,6);
% xlswrite(filename,jRightC7Shoulder,7);
% xlswrite(filename,jRightShoulder,8);
% xlswrite(filename,jRightElbow,9);
% xlswrite(filename,jRightWrist,10);
% xlswrite(filename,jLeftC7Shoulder,11);
% xlswrite(filename,jLeftShoulder,12);
% xlswrite(filename,jLeftElbow,13);
% xlswrite(filename,jLeftWrist,14);
% xlswrite(filename,jRightHip,15);
% xlswrite(filename,jRightKnee,16);
% xlswrite(filename,jRightAnkle,17);
% xlswrite(filename,jRightBallFoot,18);
% xlswrite(filename,jLeftHip,19);
% xlswrite(filename,jLeftKnee,20);
% xlswrite(filename,jLeftAnkle,21);
% xlswrite(filename,jLeftBallFoot,22);
