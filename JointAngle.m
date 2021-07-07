%% Joint Angle Extraction
%MVN will import 23 segments and 22 joints. 
%Comment or Uncomment desired varibles to extract.


%Creating Empty Matrixes
JointAngleMatrix=zeros(nSamples-3,3 );                                      %Creates empty matrix to be filled by Joint Angle Values

% %Spinal Joints
% jL5S1=JointAngleMatrix;                                                     %Copies empty matrix JointAngleMatrix and makes a new one for jL5S1
% jL4L3=JointAngleMatrix;                                                     %Copies empty matrix JointAngleMatrix and makes a new one for jL4S3
% jL1T12=JointAngleMatrix;                                                    %Copies empty matrix JointAngleMatrix and makes a new one for jL1T12
% jT9T8=JointAngleMatrix;                                                     %Copies empty matrix JointAngleMatrix and makes a new one for jT9T8
% jT1C7=JointAngleMatrix;                                                     %Copies empty matrix JointAngleMatrix and makes a new one for jT1C7
% jC1Head=JointAngleMatrix;                                                   %Copies empty matrix JointAngleMatrix and makes a new one for jC1Head
% 
% %Right Upper Body
% jRightC7Shoulder=JointAngleMatrix;                                          %Copies empty matrix JointAngleMatrix and makes a new one for jRightC7Shoulder
% jRightShoulder=JointAngleMatrix;                                            %Copies empty matrix JointAngleMatrix and makes a new one for jRightShoulder
% jRightElbow=JointAngleMatrix;                                               %Copies empty matrix JointAngleMatrix and makes a new one for jRightElbow
% jRightWrist=JointAngleMatrix;                                               %Copies empty matrix JointAngleMatrix and makes a new one for jRightWrist
% 
% %Left Upper Body
% jLeftC7Shoulder=JointAngleMatrix;                                           %Copies empty matrix JointAngleMatrix and makes a new one for jLeftC7Shoulder
% jLeftShoulder=JointAngleMatrix;                                             %Copies empty matrix JointAngleMatrix and makes a new one for jLeftShoulder
% jLeftElbow=JointAngleMatrix;                                                %Copies empty matrix JointAngleMatrix and makes a new one for jLeftElbow
% jLeftWrist=JointAngleMatrix;                                                %Copies empty matrix JointAngleMatrix and makes a new one for jLeftwrist
% 
%Right Lower Body
jRightHip=JointAngleMatrix;                                                 %Copies empty matrix JointAngleMatrix and makes a new one for jRightHip
jRightKnee=JointAngleMatrix;                                                %Copies empty matrix JointAngleMatrix and makes a new one for jRightKnee
jRightAnkle=JointAngleMatrix;                                               %Copies empty matrix JointAngleMatrix and makes a new one for jRightAnkle
jRightBallFoot=JointAngleMatrix;                                            %Copies empty matrix JointAngleMatrix and makes a new one for jRightBallFoot

%Left Lower Body
jLeftHip=JointAngleMatrix;                                                  %Copies empty matrix JointAngleMatrix and makes a new one for jLeftHip
jLeftKnee=JointAngleMatrix;                                                 %Copies empty matrix JointAngleMatrix and makes a new one for jLeftKnee
jLeftAnkle=JointAngleMatrix;                                                %Copies empty matrix JointAngleMatrix and makes a new one for jLeftAnkle
jLeftBallFoot=JointAngleMatrix;                                             %Copies empty matrix JointAngleMatrix and makes a new one for jLeftBallFoot


for n = 4:nSamples;                                                         %First three rows in matrix are unneeded information so start at row 4
    %n is the frame (each row)
    %(n-3) takes the starting point of 4 and makes it 1 for it's cooresponding matrix
    %Joint angle(#) is the column that cooresponds
    
%     %%Spinal Joints   
%     %jL5S1
%     jL5S1(n-3,1)=tree.subject.frames.frame(n).jointAngle(1);    %X  
%     jL5S1(n-3,2)=tree.subject.frames.frame(n).jointAngle(2);    %Y
%     jL5S1(n-3,3)=tree.subject.frames.frame(n).jointAngle(3);    %Z
%     
%     %jL4L3
%     jL4L3(n-3,1)=tree.subject.frames.frame(n).jointAngle(4);    %X
%     jL4L3(n-3,2)=tree.subject.frames.frame(n).jointAngle(5);    %Y
%     jL4L3(n-3,3)=tree.subject.frames.frame(n).jointAngle(6);    %Z
%     
%     %jL1T12
%     jL1T12(n-3,1)=tree.subject.frames.frame(n).jointAngle(7);   %X   
%     jL1T12(n-3,2)=tree.subject.frames.frame(n).jointAngle(8);   %Y
%     jL1T12(n-3,3)=tree.subject.frames.frame(n).jointAngle(9);   %Z
%     
%     %jT9T8
%     jT9T8(n-3,1)=tree.subject.frames.frame(n).jointAngle(10);   %X 
%     jT9T8(n-3,2)=tree.subject.frames.frame(n).jointAngle(11);   %Y
%     jT9T8(n-3,3)=tree.subject.frames.frame(n).jointAngle(12);   %Z
%     
%     %jT1C7
%     jT1C7(n-3,1)=tree.subject.frames.frame(n).jointAngle(13);   %X 
%     jT1C7(n-3,2)=tree.subject.frames.frame(n).jointAngle(14);   %Y
%     jT1C7(n-3,3)=tree.subject.frames.frame(n).jointAngle(15);   %Z
%     
%     %jC1Head
%     jC1Head(n-3,1)=tree.subject.frames.frame(n).jointAngle(16); %X 
%     jC1Head(n-3,2)=tree.subject.frames.frame(n).jointAngle(17); %Y
%     jC1Head(n-3,3)=tree.subject.frames.frame(n).jointAngle(18); %Z
%     
%     %%Right Upper Body
%     %jRightC7Shoulder or RightT4Shoulder
%     jRightC7Shoulder(n-3,1)=tree.subject.frames.frame(n).jointAngle(19);    %X 
%     jRightC7Shoulder(n-3,2)=tree.subject.frames.frame(n).jointAngle(20);    %Y
%     jRightC7Shoulder(n-3,3)=tree.subject.frames.frame(n).jointAngle(21);    %Z
%     
%     %jRightShoulder
%     jRightShoulder(n-3,1)=tree.subject.frames.frame(n).jointAngle(22);  %X
%     jRightShoulder(n-3,2)=tree.subject.frames.frame(n).jointAngle(23);  %Y
%     jRightShoulder(n-3,3)=tree.subject.frames.frame(n).jointAngle(24);  %Z
%     
%     %jRightElbow
%     jRightElbow(n-3,1)=tree.subject.frames.frame(n).jointAngle(25); %X 
%     jRightElbow(n-3,2)=tree.subject.frames.frame(n).jointAngle(26); %Y
%     jRightElbow(n-3,3)=tree.subject.frames.frame(n).jointAngle(27); %Z
%     
%     %jRightWrist
%     jRightWrist(n-3,1)=tree.subject.frames.frame(n).jointAngle(28); %X 
%     jRightWrist(n-3,2)=tree.subject.frames.frame(n).jointAngle(29); %Y
%     jRightWrist(n-3,3)=tree.subject.frames.frame(n).jointAngle(30); %Z
%     
%     %%Left Upper Body
%     %jLeftC7Shoulder of LeftT4Shoulder
%     jLeftC7Shoulder(n-3,1)=tree.subject.frames.frame(n).jointAngle(31); %X 
%     jLeftC7Shoulder(n-3,2)=tree.subject.frames.frame(n).jointAngle(32); %Y
%     jLeftC7Shoulder(n-3,3)=tree.subject.frames.frame(n).jointAngle(33); %Z
%   
%     %jLeftShoulder
%     jLeftShoulder(n-3,1)=tree.subject.frames.frame(n).jointAngle(34);   %X 
%     jLeftShoulder(n-3,2)=tree.subject.frames.frame(n).jointAngle(35);   %Y
%     jLeftShoulder(n-3,3)=tree.subject.frames.frame(n).jointAngle(36);   %Z
%     
%     %jLeftElbow
%     jLeftElbow(n-3,1)=tree.subject.frames.frame(n).jointAngle(37);  %X 
%     jLeftElbow(n-3,2)=tree.subject.frames.frame(n).jointAngle(38);  %Y
%     jLeftElbow(n-3,3)=tree.subject.frames.frame(n).jointAngle(39);  %Z
%     
%     %jLeftWrist
%     jLeftWrist(n-3,1)=tree.subject.frames.frame(n).jointAngle(40);  %X 
%     jLeftWrist(n-3,2)=tree.subject.frames.frame(n).jointAngle(41);  %Y
%     jLeftWrist(n-3,3)=tree.subject.frames.frame(n).jointAngle(42);  %Z
    
    %%Right Lower Body
    %jRightHip
    jRightHip(n-3,1)=tree.subject.frames.frame(n).jointAngle(43);   %X 
    jRightHip(n-3,2)=tree.subject.frames.frame(n).jointAngle(44);   %Y
    jRightHip(n-3,3)=tree.subject.frames.frame(n).jointAngle(45);   %Z
    
    %jRightKnee
    jRightKnee(n-3,1)=tree.subject.frames.frame(n).jointAngle(46);  %X 
    jRightKnee(n-3,2)=tree.subject.frames.frame(n).jointAngle(47);  %Y
    jRightKnee(n-3,3)=tree.subject.frames.frame(n).jointAngle(48);  %Z
    
    %jRightAnkle
    jRightAnkle(n-3,1)=tree.subject.frames.frame(n).jointAngle(49); %X 
    jRightAnkle(n-3,2)=tree.subject.frames.frame(n).jointAngle(50); %Y
    jRightAnkle(n-3,3)=tree.subject.frames.frame(n).jointAngle(51); %Z
    
    %jRightBallFoot
    jRightBallFoot(n-3,1)=tree.subject.frames.frame(n).jointAngle(52);  %X 
    jRightBallFoot(n-3,2)=tree.subject.frames.frame(n).jointAngle(53);  %Y
    jRightBallFoot(n-3,3)=tree.subject.frames.frame(n).jointAngle(54);  %Z
    
    %Left Lower Body
    %jLeftHip    
    jLeftHip(n-3,1)=tree.subject.frames.frame(n).jointAngle(55);    %X 
    jLeftHip(n-3,2)=tree.subject.frames.frame(n).jointAngle(56);    %Y
    jLeftHip(n-3,3)=tree.subject.frames.frame(n).jointAngle(57);    %Z
    
    %jLeftKnee
    jLeftKnee(n-3,1)=tree.subject.frames.frame(n).jointAngle(58);   %X
    jLeftKnee(n-3,2)=tree.subject.frames.frame(n).jointAngle(59);   %Y
    jLeftKnee(n-3,3)=tree.subject.frames.frame(n).jointAngle(60);   %Z
    
    %jLeftAnkle
    jLeftAnkle(n-3,1)=tree.subject.frames.frame(n).jointAngle(61);  %X
    jLeftAnkle(n-3,2)=tree.subject.frames.frame(n).jointAngle(62);  %Y
    jLeftAnkle(n-3,3)=tree.subject.frames.frame(n).jointAngle(63);  %Z
   
    %jLeftBallFoot
    jLeftBallFoot(n-3,1)=tree.subject.frames.frame(n).jointAngle(64);   %X
    jLeftBallFoot(n-3,2)=tree.subject.frames.frame(n).jointAngle(65);   %Y
    jLeftBallFoot(n-3,3)=tree.subject.frames.frame(n).jointAngle(66);   %Z 
    
end

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
