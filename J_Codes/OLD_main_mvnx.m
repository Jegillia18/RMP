%% Code to Extract and Organize IMU Data 
%%Cazmon Suri
%%Note Code can be adjusted to include and exclude data
%%Segment Displacements can be added if desired
%%Must be used with load_mvnx.m function
clear;
clc;
close all;
set = [56];%[40,41,43:53,55,56,60,62:65,67,68,70,73,74];

warning('off')
%% Import .MVNX File in Matlab
for s = 1:length(set)
    p = set(s);  
    
for t = 3
for q = 2:3
   P_folder =sprintf('P0%d',p);
   addpath(P_folder)  
  
  loadfile = sprintf('WBV_629b_P0%d_T%d_walk-00%d.mvnx',p,t,q);
    
   if exist(loadfile, 'file') == 0
       break
   end
   
   
%load data
tree = load_mvnx(sprintf('WBV_629b_P0%d_T%d_walk-00%d',p,t,q));                              % Calls load_mvnx.m file to import desires mvn file
% read some basic data from the file
mvnxVersion = tree;
fileComments = tree.subject.comment;                                         % Pulls the comments and creates variable
%read some basic properties of the subject;
frameRate = tree.subject.frameRate;                                          % Pulls the framerate and creates variable
suitLabel = tree.subject.label;                                              % Pulls the label and creates variable
originalFilename = tree.subject.originalFilename;                            % Pulls the original file name and creates variable
recDate = tree.subject.recDate;                                              % Pulls the record date and creates variable
segmentCount = tree.subject.segmentCount;                                    % Pulls the segment count and creates variable

time = [tree.subject.frames.frame.time];
time = time(4:end-1)';
time = time/1000;


index = [tree.subject.frames.frame.index];
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


run('Left_extraction.m')
run('Right_extraction.m')

% p=1;
% t=1;

% LeftHip = jLeftHip(:,3);
% LeftKnee = jLeftKnee(:,3);
% 
% 
% TL = sprintf('P%d Session%d left',p,t);
% %tite = cell2mat(tite);
% 
% fig_L = plot(LeftHip,LeftKnee);
% title(TL)
% xlabel('Hip');
% ylabel('Knee');
% saveas(fig_L,TL,'meta')
% 
% figure
% RightHip = jRightHip(:,3);
% RightKnee = jRightKnee(:,3);
% 
% 
% TR = sprintf('P%d Session%d right',p,t);
% %tite = cell2mat(tite);
% 
% fig_R = plot(RightHip,RightKnee);
% title(TR)
% xlabel('Hip');
% ylabel('Knee');
% saveas(fig_R,TR,'meta')

filename = sprintf('P%d_Walking_Data_Hope.xls',p);

if q == 1
    
xlswrite(filename, Right, t, 'E2');
xlswrite(filename, Left, t, 'E38');

elseif q == 2
   
xlswrite(filename, Right, t, 'E14');
xlswrite(filename, Left, t, 'E50');
    
elseif q == 3

xlswrite(filename, Right, t, 'E26');
xlswrite(filename, Left, t, 'E62');
    
end
clearvars -except p t q mainfolder set s
end
end
end
warning('on')


