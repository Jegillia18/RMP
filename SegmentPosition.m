%% Segment Position Extraction
%MVN will import 23 segments and 22 joints. 
%Comment or Uncomment desired varibles to extract.


%Creating Empty Matrixes
SegmentPositionMatrix=zeros(nSamples-3,3 );                                %Creates empty matrix to be filled by Segment Position Values

%Spinal Segments
Pelvis=SegmentPositionMatrix;                                              %Copies empty matrix SegmentPositionMatrix and makes a new one for Pelvis
% L5=SegmentPositionMatrix;                                                  %Copies empty matrix SegmentPositionMatrix and makes a new one for L5
% L3=SegmentPositionMatrix;                                                  %Copies empty matrix SegmentPositionMatrix and makes a new one for L3
% T12=SegmentPositionMatrix;                                                 %Copies empty matrix SegmentPositionMatrix and makes a new one for T12
% T8=SegmentPositionMatrix;                                                  %Copies empty matrix SegmentPositionMatrix and makes a new one for T8
% Neck=SegmentPositionMatrix;                                                %Copies empty matrix SegmentPositionMatrix and makes a new one for Neck
% Head=SegmentPositionMatrix;                                                %Copies empty matrix SegmentPositionMatrix and makes a new one for Head
% 
% %Right Upper Body
% RightShoulder=SegmentPositionMatrix;                                       %Copies empty matrix SegmentPositionMatrix and makes a new one for RightShoulder
% RightUpperArm=SegmentPositionMatrix;                                       %Copies empty matrix SegmentPositionMatrix and makes a new one for RightUpperArm
% RightForeArm=SegmentPositionMatrix;                                        %Copies empty matrix SegmentPositionMatrix and makes a new one for RightForeArm
% RightHand=SegmentPositionMatrix;                                           %Copies empty matrix SegmentPositionMatrix and makes a new one for RightHand
% 
% %Left Upper Body
% LeftShoulder=SegmentPositionMatrix;                                        %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftShoulder
% LeftUpperArm=SegmentPositionMatrix;                                        %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftUpperArm
% LeftForeArm=SegmentPositionMatrix;                                         %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftForeArm
% LeftHand=SegmentPositionMatrix;                                            %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftHand

%Right Lower Body
RightUpperLeg=SegmentPositionMatrix;                                       %Copies empty matrix SegmentPositionMatrix and makes a new one for RightUpperLeg
RightLowerLeg=SegmentPositionMatrix;                                       %Copies empty matrix SegmentPositionMatrix and makes a new one for RightLowerLeg
RightFoot=SegmentPositionMatrix;                                           %Copies empty matrix SegmentPositionMatrix and makes a new one for RightFoot
RightToe=SegmentPositionMatrix;                                            %Copies empty matrix SegmentPositionMatrix and makes a new one for RightToe

%Left Lower Body
LeftUpperLeg=SegmentPositionMatrix;                                        %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftUpperLeg
LeftLowerLeg=SegmentPositionMatrix;                                        %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftLowerLeg
LeftFoot=SegmentPositionMatrix;                                            %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftFoot
LeftToe=SegmentPositionMatrix;                                             %Copies empty matrix SegmentPositionMatrix and makes a new one for LeftToe


for n = 4:nSamples;                                                         %First three rows in matrix are unneeded information so start at row 4
    %n is the frame (each row)
    %(n-3) takes the starting point of 4 and makes it 1 for it's cooresponding matrix
    %position(#) is the column that cooresponds
    %For segment position there is tpose data (n=1:3)that may be necessary if we chose to do change in position analysis 
    
%     %%Spinal Segments   
    %Pelvis
    Pelvis(n-3,1)=tree.segmentData(n).position(1);    %X  
    Pelvis(n-3,2)=tree.segmentData(1).position(2);    %Y
    Pelvis(n-3,3)=tree.segmentData(1).position(3);    %Z
%     
%     %L5
%     L5(n-3,1)=tree.subject.frames.frame(n).position(4);    %X
%     L5(n-3,2)=tree.subject.frames.frame(n).position(5);    %Y
%     L5(n-3,3)=tree.subject.frames.frame(n).position(6);    %Z
%     
%     %L3
%     L3(n-3,1)=tree.subject.frames.frame(n).position(7);   %X   
%     L3(n-3,2)=tree.subject.frames.frame(n).position(8);   %Y
%     L3(n-3,3)=tree.subject.frames.frame(n).position(9);   %Z
%     
%     %T12
%     T12(n-3,1)=tree.subject.frames.frame(n).position(10);   %X 
%     T12(n-3,2)=tree.subject.frames.frame(n).position(11);   %Y
%     T12(n-3,3)=tree.subject.frames.frame(n).position(12);   %Z
%     
%     %T8
%     T8(n-3,1)=tree.subject.frames.frame(n).position(13);   %X 
%     T8(n-3,2)=tree.subject.frames.frame(n).position(14);   %Y
%     T8(n-3,3)=tree.subject.frames.frame(n).position(15);   %Z
%     
%     %Neck
%     Neck(n-3,1)=tree.subject.frames.frame(n).position(16); %X 
%     Neck(n-3,2)=tree.subject.frames.frame(n).position(17); %Y
%     Neck(n-3,3)=tree.subject.frames.frame(n).position(18); %Z
%     
%     %Head
%     Head(n-3,1)=tree.subject.frames.frame(n).position(19); %X 
%     Head(n-3,2)=tree.subject.frames.frame(n).position(20); %Y
%     Head(n-3,3)=tree.subject.frames.frame(n).position(21); %Z
%     
%     %%Right Upper Body
%     %RightShoulder
%     RightShoulder(n-3,1)=tree.subject.frames.frame(n).position(22);    %X 
%     RightShoulder(n-3,2)=tree.subject.frames.frame(n).position(23);    %Y
%     RightShoulder(n-3,3)=tree.subject.frames.frame(n).position(24);    %Z
%     
%     %RightUpperArm
%     RightUpperArm(n-3,1)=tree.subject.frames.frame(n).position(25);  %X
%     RightUpperArm(n-3,2)=tree.subject.frames.frame(n).position(26);  %Y
%     RightUpperArm(n-3,3)=tree.subject.frames.frame(n).position(27);  %Z
%     
%     %RightForeArm
%     RightForeArm(n-3,1)=tree.subject.frames.frame(n).position(28); %X 
%     RightForeArm(n-3,2)=tree.subject.frames.frame(n).position(29); %Y
%     RightForeArm(n-3,3)=tree.subject.frames.frame(n).position(30); %Z
%     
%     %jRightHand
%     RightHand(n-3,1)=tree.subject.frames.frame(n).position(31); %X 
%     RightHand(n-3,2)=tree.subject.frames.frame(n).position(32); %Y
%     RightHand(n-3,3)=tree.subject.frames.frame(n).position(33); %Z
%     
%     %%Left Upper Body
%     %LeftShoulder
%     LeftShoulder(n-3,1)=tree.subject.frames.frame(n).position(34); %X 
%     LeftShoulder(n-3,2)=tree.subject.frames.frame(n).position(35); %Y
%     LeftShoulder(n-3,3)=tree.subject.frames.frame(n).position(36); %Z
%   
%     %LeftUpperArm
%     LeftUpperArm(n-3,1)=tree.subject.frames.frame(n).position(37);   %X 
%     LeftUpperArm(n-3,2)=tree.subject.frames.frame(n).position(38);   %Y
%     LeftUpperArm(n-3,3)=tree.subject.frames.frame(n).position(39);   %Z
%     
%     %LeftForeArm
%     LeftForeArm(n-3,1)=tree.subject.frames.frame(n).position(40);  %X 
%     LeftForeArm(n-3,2)=tree.subject.frames.frame(n).position(41);  %Y
%     LeftForeArm(n-3,3)=tree.subject.frames.frame(n).position(42);  %Z
%     
%     %LeftHand
%     LeftHand(n-3,1)=tree.subject.frames.frame(n).position(43);  %X 
%     LeftHand(n-3,2)=tree.subject.frames.frame(n).position(44);  %Y
%     LeftHand(n-3,3)=tree.subject.frames.frame(n).position(45);  %Z
%     
    %%Right Lower Body
    %RightUpperLeg
%     RightUpperLeg(n-3,1)=tree.subject.frames.frame(n).position(46);   %X 
%     RightUpperLeg(n-3,2)=tree.subject.frames.frame(n).position(47);   %Y
%     RightUpperLeg(n-3,3)=tree.subject.frames.frame(n).position(48);   %Z
%     
%     %RightLowerLeg
%     RightLowerLeg(n-3,1)=tree.subject.frames.frame(n).position(49);  %X 
%     RightLowerLeg(n-3,2)=tree.subject.frames.frame(n).position(50);  %Y
%     RightLowerLeg(n-3,3)=tree.subject.frames.frame(n).position(51);  %Z
%     
%     %RightFoot
%     RightFoot(n-3,1)=tree.subject.frames.frame(n).position(52); %X 
%     RightFoot(n-3,2)=tree.subject.frames.frame(n).position(53); %Y
%     RightFoot(n-3,3)=tree.subject.frames.frame(n).position(54); %Z
%     
%     %RightToe
%     RightToe(n-3,1)=tree.subject.frames.frame(n).position(55);  %X 
%     RightToe(n-3,2)=tree.subject.frames.frame(n).position(56);  %Y
%     RightToe(n-3,3)=tree.subject.frames.frame(n).position(57);  %Z
%     
%     %Left Lower Body
%     %LeftUpperLeg    
%     LeftUpperLeg(n-3,1)=tree.subject.frames.frame(n).position(58);    %X 
%     LeftUpperLeg(n-3,2)=tree.subject.frames.frame(n).position(59);    %Y
%     LeftUpperLeg(n-3,3)=tree.subject.frames.frame(n).position(60);    %Z
%     
%     %LeftLowerLeg
%     LeftLowerLeg(n-3,1)=tree.subject.frames.frame(n).position(61);   %X
%     LeftLowerLeg(n-3,2)=tree.subject.frames.frame(n).position(62);   %Y
%     LeftLowerLeg(n-3,3)=tree.subject.frames.frame(n).position(63);   %Z
%     
%     %LeftFoot
%     LeftFoot(n-3,1)=tree.subject.frames.frame(n).position(64);  %X
%     LeftFoot(n-3,2)=tree.subject.frames.frame(n).position(65);  %Y
%     LeftFoot(n-3,3)=tree.subject.frames.frame(n).position(66);  %Z
%    
%     %LeftToe
%     LeftToe(n-3,1)=tree.subject.frames.frame(n).position(67);   %X
%     LeftToe(n-3,2)=tree.subject.frames.frame(n).position(68);   %Y
%     LeftToe(n-3,3)=tree.subject.frames.frame(n).position(69);   %Z 
%     
    
    
end

% %% %% Organize Data in Excel
% %Creates Table of All the segment names, not neccesary but could be useful
% SegmentNames={'Pelvis','L5','L3','T12','T8','Neck','Head','RightShoulder','RightUpperArm','RightForeArm','RightHand','LeftShoulder','LeftUpperArm','LeftForeArm','LeftHand','RightUpperLeg','RightLowerLeg','RightFoot','RightToe','LeftUpperLeg','LeftLowerLeg','LeftFoot','LeftToe'};
% 
% %Copies Segment Data to Excel into seperate sheets
% %NOTE: xlswrite function will rewrite over specified excel file each time
% %it runs
% filename = 'SegmentPositionData.xlsx';
% xlswrite(filename,Pelvis,1);
% xlswrite(filename,L5,2);
% xlswrite(filename,L3,3);
% xlswrite(filename,T12,4);
% xlswrite(filename,T8,5);
% xlswrite(filename,Neck,6);
% xlswrite(filename,Head,7);
% xlswrite(filename,RightShoulder,8);
% xlswrite(filename,RightUpperArm,9);
% xlswrite(filename,RightForeArm,10);
% xlswrite(filename,RightHand,11);
% xlswrite(filename,LeftShoulder,12);
% xlswrite(filename,LeftUpperArm,13);
% xlswrite(filename,LeftForeArm,14);
% xlswrite(filename,LeftHand,15);
% xlswrite(filename,RightUpperLeg,16);
% xlswrite(filename,RightLowerLeg,17);
% xlswrite(filename,RightFoot,18);
% xlswrite(filename,RightToe,19);
% xlswrite(filename,LeftUpperLeg,20);
% xlswrite(filename,LeftLowerLeg,21);
% xlswrite(filename,LeftFoot,22);
% xlswrite(filename,LeftToe,23);
