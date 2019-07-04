load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\Organized_CellReg\Jose\Rec B and Remote B\cellRegistered_20190702_141708.mat')
%% For CellReg Session 4

clear all

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\Organized_CellReg\Jose\Rec B and Remote B\cellRegistered_20190702_141708.mat')

close all


 figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])

count=0;

for i=size(cell_registered_struct.cell_to_index_map,1):-1:1
   
    
 plot_num=nnz(cell_registered_struct.cell_to_index_map(i,:)); 

 xyz=1;
 
 
 disp(i);
 
          
 
     if plot_num==2

 count=count+1
 
%   if mod(count,5)==0
%       figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])
%  
%   end
%% Session 1
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\Size10_data\msCam_data_processed_refined.mat')

subplot(2,1,xyz)
sigt= 2.*normalize(sigfn(x,:));
plot(sigt(1:2000)+count,'LineWidth',2)
hold on 
clear sigt
% h = get(gca, 'Title');
% origtitle = get(h,'String');
% set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 2
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M3_S27_mouse_5_remote_context_B_29052019\size10data\msCam_data_processed.mat')

subplot(2,1,xyz)
sigt= 2.*normalize(sigfn(x,:));
plot(sigt(3000:5000)+count,'LineWidth',2)
hold on 
clear sigt

%h = get(gca, 'Title');
%origtitle = get(h,'String');
%set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;



 
    end
end