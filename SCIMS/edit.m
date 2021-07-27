
                   
                    app.JData_x = app.tree.data(usersValue1).jointData(1).jointAngle(:,1);
                    
                    app.JData_y = app.tree.data(usersValue1).jointData(1).jointAngle(:,2);
                        
                    app.JData_z = app.tree.data(usersValue1).jointData(1).jointAngle(:,3);
                            
                    T = table(app.JData_x, app.JData_y, app.JData_z);
                    T.Properties.VariableNames = {'X','Y','Z'};
                    fig = uifigure('Name',sprintf('Participant_%d',usersValue1));
                    fig.Position = [140 80 900 600];
                    
                    ax = uiaxes(fig);
                    ax2 = uiaxes(fig);
                    ax3 = uiaxes(fig);
                    ax.Position = [400 10 500 200];
                    ax2.Position = [400 200 500 200];
                    ax3.Position = [400 400 500 200];
                    ax.YLabel.String = '[X]';
                    ax2.YLabel.String = '[Y]';
                    ax3.YLabel.String = '[Z]';
                    y3 = app.JData_z;
                    y2 = app.JData_y;
                    y1 = app.JData_x;
                    time = str2double(app.tree.data(usersValue1).frame{:,3});
                    time = (time)/1000; 
                    plot(ax,time,y1)
                    plot(ax2,time,y2)
                    plot(ax3,time,y3)
                    
                    uit = uitable(fig,'Data',T);
                    uit.Position = [10 10 300 550];
                    uit.RowName = 'numbered';
                    fig.AutoResizeChildren = 'on';
                    
                    