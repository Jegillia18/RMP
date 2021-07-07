%% Code to Extract and Organize IMU Data 
%%Cazmon Suri
%%Note Code can be adjusted to include and exclude data
%%Segment Displacements can be added if desired
%%Must be used with load_mvnx.m function
clear;
clc;
close all;
set = [11];%[23,25,26];%[1,2,3,8b,10,12,22,24]; %4:7,9,

warning('off')
%% Import .MVNX File in Matlab
for s = 1:length(set)
    p = set(s);  
    
for t = 3
for q = 2
    P_folder =sprintf('P0%d',p);
   addpath(P_folder)  
  try
  %loadfile = sprintf('SCIMS_703_00%d_S%d_pre_walk-%d.mvnx',p,t,q);
    loadfile = sprintf('SCIMS_703_001_S1_pre_walk-1');
%    if exist(loadfile, 'file') == 0
%        break
%    end
%    
   
%load data
%tree = load_mvnx(sprintf('SCIMS_703_00%d_S%d_pre_walk-%d',p,t,q));
tree = load_mvnx(sprintf('SCIMS_703_001_S1_pre_walk-1'))
  catch
      Trial_ACC(q) = NaN;
      break
  end
% Calls load_mvnx.m file to import desires mvn file
% read some basic data from the file
mvnxVersion = tree;
%fileComments = tree.subject.comment;                                         % Pulls the comments and creates variable
%read some basic properties of the subject;
frameRate = tree.subject.frameRate;                                          % Pulls the framerate and creates variable
suitLabel = tree.subject.label;                                              % Pulls the label and creates variable
originalFilename = tree.subject.originalFilename;                            % Pulls the original file name and creates variable
recDate = tree.subject.recDate;                                              % Pulls the record date and creates variable
segmentCount = tree.subject.segmentCount;                                    % Pulls the segment count and creates variable

time = [tree.subject.frames.frame.time];
time = time(4:end-1)';
time = time/1000;


index = [tree.subject.frames.frame(4:end).index];
index(end) = []; 



%retrieve sensor labels
%creates a struct with sensor data
if isfield(tree.subject,'sensors') && isstruct(tree.subject.sensors)
    sensorData = tree.subject.sensors.sensor;
end
%retrieve segment labels
%creates a struct with segment definitions
if isfield(tree.subject,'segments') && isstruct(tree.subject.segments)
    segmentData = tree.subject.segments.segment;
end
%retrieve the data frames from the subject
nSamples = length(tree.subject.frames.frame);
%pre allocate
%pre allocate some memory for the position of Segment1
p_Segment1 = zeros(nSamples,3);
%read the data from the structure e.g. segment 1
if isfield(tree.subject.frames.frame(1),'position')
    for i=[1:nSamples]
        p_Segment1(i,:)=tree.subject.frames.frame(i).position(1:3);
    end
    %Plot
%     figure('name','Position of first segment')
%     plot(p_Segment1)
%     figure('name','Position of first segment in 3D')
%     plot3(p_Segment1(:,1),p_Segment1(:,2),p_Segment1(:,3));
end
%% Data Extraction and Organization
% Will run scripts to extracted desired data. Comment out any data you
% don't wish to extract 

run('SegmentPosition.m');
% run('SegmentVelocity.m');
% run('SegmentAcceleration.m');
% run('SegmentAngularAcceleration.m');
% run('SegmentAngularVelocity.m');
run('JointAngle.m');
%run('ContactData.m')

% % 
%run('Left_extraction.m')
run('Right_extraction.m')

% p=1;
% t=1;
% 
% LeftHip = jLeftHip(:,3);
% LeftKnee = jLeftKnee(:,3);
% 
% RightHip = jRightHip(:,3);
% RightKnee = jRightKnee(:,3);
% % 
% plot(RightHip,RightKnee)
% title(Right)
% figure 
% plot(LeftHip,LeftKnee)
%title(Left)
 Trial_ACC(q) = ACC;
% 
% TL = sprintf('P%d Session%d left',p,t);

%tite = cell2mat(tite);

% fig_L = plot(LeftHip,LeftKnee);
% title(TL)
% xlabel('Hip');
% ylabel('Knee');
% saveas(fig_L,TL,'meta')

% figure
% RightHip = jRightHip(:,3);
% RightKnee = jRightKnee(:,3);
% 
% 
% TR = sprintf('P%d Session%d right',p,t);
% tite = cell2mat(tite);

% h = animatedline('Color','b','Linewidth',3);
% axis([-20 25 -10 70])

% for i=1:length(RightHip)
%     pause(0.1)
% y = RightKnee(i);
% x = RightHip(i);
% addpoints(h,x,y); 
% % plot(RightHip(i),RightKnee(i));%,'-','MarkerSize',5,'MarkerFaceColor','r')
% drawnow limitrate
% title('Right Leg RMP')
% xlabel('Right Hip');
% ylabel('Right Knee');
% % % saveas(fig_R,TR,'meta')
% % 
%  end

% filename = sprintf('P%d_Walking_Data_Hope.xls',p);
% 
% if q == 1
%     
% xlswrite(filename, Right, t, 'E2');
% xlswrite(filename, Left, t, 'E38');
% 
% elseif q == 2
%    
% xlswrite(filename, Right, t, 'E14');
% xlswrite(filename, Left, t, 'E50');
%     
% elseif q == 3
% 
% xlswrite(filename, Right, t, 'E26');
% xlswrite(filename, Left, t, 'E62');
    
end
Session_ACC(:,t) = Trial_ACC';
clearvars -except p t q mainfolder set s Participant_ACC Session_ACC
end
 Participant_ACC(:,p) = [p;Session_ACC(:)];

clear Session_ACC
end
% end
warning('on')


