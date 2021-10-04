%% Load data
% Change the filename here to the name of the file you would like to import


clear
clc

set = [2];%, 4, 5, 6, 8, 9, 13, 14, 15, 16, 18]; % alter here for participant specific ID's
tree.data = table;

            
% This set for all other trials
for y = 1:length(set)
    p = set(y);
    for t = 1:4
       for d = 1:3
           try
           tree = load_mvnx(sprintf('P0%d_T%d_WALK%d',p,t,d));
           catch 
               try
               tree = load_mvnx(sprintf('P%d_T%d_WALK%d',p,t,d)); 
               catch
             

%% Read some basic data from the file
mvnxVersion = tree.metaData.mvnx_version; % version of the MVN Studio used during recording

if (isfield(tree.metaData, 'comment'))
    fileComments = tree.metaData.comment; % comments written when saving the file
end

%% Read some basic properties of the subject;
frameRate = tree.metaData.subject_frameRate;
suitLabel = tree.metaData.subject_label;
originalFilename = tree.metaData.subject_originalFilename;
recDate = tree.metaData.subject_recDate;
segmentCount = tree.metaData.subject_segmentCount;

%% Retrieve sensor labels
%creates a struct with sensor data
if isfield(tree,'sensorData') && isstruct(tree.sensorData)
    sensorData = tree.sensorData;
end

%% Retrieve segment labels
%creates a struct with segment definitions
if isfield(tree,'segmentData') && isstruct(tree.segmentData)
    segmentData = tree.segmentData;
end

%retrieve the data frames from the subject
nSamples = length(tree.segmentData);



%% Read the data from the structure e.g. segment 1
if isfield(tree.segmentData,'position')
    % Plot position of segment 1
%     figure('name','Position of first segment')
%     plot(tree.segmentData(1).position)
%     xlabel('frames')
%     ylabel('Position in the global frame')
%     legend('x','y','z')
%     title ('Position of first segment')
    
    % Plot 3D displacement of segment 1
%     figure('name','Position of first segment in 3D')
%     plot3(tree.segmentData(1).position(:,1),tree.segmentData(1).position(:,2),tree.segmentData(1).position(:,3));
%     xlabel('x')
%     ylabel('y')
%     zlabel('z')
%     title ('Displacement of first segment in space')
end
               end
           end
       end
    end
end

%%
% run('SegmentPosition.m');
% run('JointAngle.m');
% time = str2double({tree.frame.time})/1000;

