%% For CellReg Session 4

clear all

% load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\postrefinecr\cellRegistered_20190624_160623.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\cellregtest\cellRegistered_20190624_144841.mat')

close all


 figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])

count=0;

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

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M21_S18_mouse5_training_30042019\head_dir_mouse_5_training_leds2019-06-18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M21_S18_mouse5_training_30042019\Data_at_size10\msCam_data_processed.mat')
subplot(3,1,xyz)
sigt =downsample(sigfn(x,:),10);
plot(sigt(1:300)+count)
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

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\head_dir_mouse_5_recent_contextB_0205_leds2019-06-14T13_49_07.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\Size10_data\msCam_data_processed.mat')

subplot(3,1,xyz)
sigt =downsample(sigfn(x,:),10);
plot(sigt(1:300)+count)
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

 load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M46_S40_mouse_5_remote_context_A_28052019_repetition\head_dir_mouse_5_remote_contextA_2805_rep_leds2019-06-18T14_31_18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M46_S40_mouse_5_remote_context_A_28052019_repetition\size10data\msCam_data_processed.mat')


subplot(3,1,xyz)
sigt =downsample(sigfn(x,:),10);
plot(sigt(1:300)+count)
hold on 
clear sigt

end

xyz=xyz+1;


 
    end
end