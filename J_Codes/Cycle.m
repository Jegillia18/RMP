 while length(Left_Cycle) ~= length(Right_Cycle)  %Correcting unmatched TO or HS
if length(Left_Cycle) > length(Right_Cycle)
    Left_Cycle(:,end) = [];
    
elseif length(Right_Cycle) > length(Left_Cycle)
    Right_Cycle(:,end) = [];
    
end
end






Cycles  = [Left_Cycle; Right_Cycle];
Cycles  = topkrows(Cycles, 4, 1, 'ascend');