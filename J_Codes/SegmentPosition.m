%% Segment Position Extraction

%%
%MVN will import 23 segments 

    Pelvis = tree.segmentData(1).position;    %X,Y,Z  
    
    L5 = tree.segmentData(2).position;    %X,Y,Z  
        
    L3 = tree.segmentData(3).position;    %X,Y,Z  
        
    T12 = tree.segmentData(4).position;    %X,Y,Z  
       
    T8 = tree.segmentData(5).position;    %X,Y,Z  
    
    Neck = tree.segmentData(6).position;    %X,Y,Z  
    
    Head = tree.segmentData(7).position;    %X,Y,Z  
    
    RightShoulder = tree.segmentData(8).position;    %X,Y,Z  
    
    RightUA = tree.segmentData(9).position;    %X,Y,Z  
    
    RightFA = tree.segmentData(10).position;    %X,Y,Z 
     
    RightH = tree.segmentData(11).position;    %X,Y,Z  
 
    LeftShoulder = tree.segmentData(12).position;    %X,Y,Z  
     
    LeftUA = tree.segmentData(13).position;    %X,Y,Z 
 
    LeftFA = tree.segmentData(14).position;    %X,Y,Z  
 
    LeftH = tree.segmentData(15).position;    %X,Y,Z  
 
    RightUL = tree.segmentData(16).position;    %X,Y,Z  
   
    RightLL = tree.segmentData(17).position;    %X,Y,Z  
   
    RightF = tree.segmentData(18).position;    %X,Y,Z  
 
    RightToe = tree.segmentData(19).position;    %X,Y,Z 
  
    LeftUL = tree.segmentData(20).position;    %X,Y,Z  

    LeftLL = tree.segmentData(21).position;    %X,Y,Z  
   
    LeftF = tree.segmentData(22).position;    %X,Y,Z  
  
    LeftToe = tree.segmentData(23).position;    %X,Y,Z  
  
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
% xlswrite(filename,RightUA,9);
% xlswrite(filename,RightFA,10);
% xlswrite(filename,RightH,11);
% xlswrite(filename,LeftShoulder,12);
% xlswrite(filename,LeftUA,13);
% xlswrite(filename,LeftFA,14);
% xlswrite(filename,LeftH,15);
% xlswrite(filename,RightUL,16);
% xlswrite(filename,RightLL,17);
% xlswrite(filename,RightF,18);
% xlswrite(filename,RightToe,19);
% xlswrite(filename,LeftUL,20);
% xlswrite(filename,LeftLL,21);
% xlswrite(filename,LeftF,22);
% xlswrite(filename,LeftToe,23);
