%% For Mouse61 CellReg Session 1

clear all

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\CELLreg2size10\cellRegistered_20190625_174019.mat')

close all

for i=size(cell_registered_struct.cell_to_index_map,1):-1:1
   
    
 plot_num=nnz(cell_registered_struct.cell_to_index_map(i,:)); 

 xyz=1;
 
 
 disp(i);
 
     if plot_num==3
         
         figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])
 
         
%% Session 1
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\head_dir_mouse61_training_leds2019-11-19T16_47_41.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\size10data\combineddata_refined.mat')

subplot(1,3,xyz)

PFD_calc_fun(x,head_dir,sigfn)

h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 2
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M49_S10_mouse61_recent_context_A_12062019\head_dir_mouse61_recent_contextA_leds2019-06-19T16_56_29.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M49_S10_mouse61_recent_context_A_12062019\size10data\msCam_data_processed_refined.mat')

subplot(1,3,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 3

if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M46_S3_mouse_61_recent_context_B_13062019\head_dir_mouse61_recent_contextB_leds2019-06-19T17_09_17.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M46_S3_mouse_61_recent_context_B_13062019\size10data\msCam_data_processed_refined.mat')

subplot(1,3,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;
 
    end
end