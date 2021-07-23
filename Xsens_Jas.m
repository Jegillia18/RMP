clear;clc;

app.set = [2, 4, 5, 6, 8, 9, 13, 14, 15, 16, 18]; % alter here for participant specific ID's
            
% This set for all other trials
for y = 1:length(app.set)
    p = app.set(y);
    for t = 1:4
       for d = 1:3
           try
           app.tree.data = load_mvnx(sprintf('P%d_T%d_R_D%d',p,t,d));

           Dorsi_L = app.tree.data.jointData(21).jointAngle(:,3); %dorsiflexion in z axis L
           Dorsi_R = app.tree.data.jointData(17).jointAngle(:,3); %dorsiflexion in z axis R

           Vol_L = max(abs(Dorsi_L)) - min(abs(Dorsi_L)); %Left
           Vol_R = max(abs(Dorsi_R)) - min(abs(Dorsi_R)); %Right

           Dor_L = max(abs(Dorsi_L)); %Left
           Dor_R =max(abs(Dorsi_R)); %Right

           Table_D(d,:) = [p,t,d,Vol_L,Vol_R,Dor_L,Dor_R];

           catch
           Table_D(d,:) = [p,t,d, nan,nan,nan,nan];

           end

       end


       if t == 1
       Table_T1 = Table_D;
       elseif t == 2
       Table_T2 = Table_D;
       elseif t == 3
       Table_T3 = Table_D;
       elseif t == 4
       Table_T4 = Table_D;
       end

    end
    Table_T = [Table_T1;Table_T2;Table_T3;Table_T4];
    
    y_1 = num2str(y);
    filename = 'Participant_Data_Jas.xls';
    writematrix(Table_T, filename,'Sheet',y_1);
    
end



% for y = 1:length(app.set)
%     p = app.set(y);
%     filename = 'Participant_Jas2.xlsx';
%     xlswrite(filename,Table_Y);
%     e = actxserver('Excel.Application'); % # open Activex server
%     ewb = e.Workbooks.Open('C:\Users\Jessica S. Gilliam\Documents\MATLAB\ShepherdCenter\RMP\Participant_Jas2.xlsx'); % # open file (enter full path!) location of file to be written to
%     sheetname = sprintf('Participant %d',p);
%     ewb.Worksheets.Item(y).Name = sheetname; % # rename 1st sheet
%     ewb.Save % # save to the same file
%     ewb.Close(false)
%     e.Quit
% end         
 


