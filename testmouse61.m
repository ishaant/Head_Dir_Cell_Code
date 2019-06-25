%% For CellReg Session 4

clear all

% load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\postrefinecr\cellRegistered_20190624_160623.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\CellReg1\cellRegistered_20190620_114558.mat')

close all


 figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])

count=-1+0.075;

for i=size(cell_registered_struct.cell_to_index_map,1):-1:1
   
    
 plot_num=nnz(cell_registered_struct.cell_to_index_map(i,:)); 

 xyz=1;
 
 
 disp(i);
 
          
 
     if plot_num==3

 count=count+1
 
  if mod(count,5)==0
      figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])
 
  end
%% Session 1
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\msCam_data_processed.mat')
subplot(3,1,xyz)
sigt =downsample(sigfn(x,:),10);
plot(sigt+count)
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

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M49_S10_mouse61_recent_context_A_12062019\msCam_data_processed.mat')


subplot(3,1,xyz)
sigt =downsample(sigfn(x,:),10);
plot(sigt+count)
hold on 
clear sigt

%h = get(gca, 'Title');
%origtitle = get(h,'String');
%set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 3

if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M46_S3_mouse_61_recent_context_B_13062019\msCam_data_processed.mat')

subplot(3,1,xyz)
sigt =downsample(sigfn(x,:),10);
plot(sigt+count)
hold on 
clear sigt

end

xyz=xyz+1;


 
    end
end