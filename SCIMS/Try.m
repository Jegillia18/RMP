 
% clc;clear;
% 
%             files = (dir ('*.mvnx')); %list of mvnx files
%             y = ({files.name})';
%             checkbox = (repelem({false},length(y)))';
%             Data = [y checkbox];
%             
%             f = figure('Position',[300 200 500 350]);
%             columnname =   {'Participant ID#', 'Analyze'};
%             %columnformat = {'long', 'logical'};
%             columneditable =  [false true]; 
%             t = uitable('Units','normalized','Position',...
%               [0.1 0.1 0.9 0.9], 'Data', Data,... 
%               'ColumnName', columnname,...
%               'ColumnEditable', columneditable,...
%               'RowName',[] ,'BackgroundColor',[.7 .9 .8],'ForegroundColor',[0 0 0]);
%            Data_new = get(t, 'Data');
%           %data has now changed to logical - true, how to export this such
%           %that we know how to run through the rest of the code?
%           

% files = (dir ('*.mvnx')); %list of mvnx files
%          y = ({files.name})';
%             checkbox = [{'false'},{'true'},{'false'}]';
%             app.TData = [y checkbox];
%             
%             app.UITable.Data = app.TData;
%             
%             New_Data = app.UITable.Data.var(:)


%  fig = uifigure; 
%             files = dir ('*.mvnx'); %list of mvnx files
%              %returns sequential order
%              
%                 y = {files.name}; 
%                 
%                 y = cell2table(y);
%             
%             
%             x = files(1).name;
%             dd = uidropdown(fig,'Position',[320 160 100 22],'Items',(y),'Value',x,...
%                     'ValueChangedFcn',@(dd,event) selection(dd,y));
          