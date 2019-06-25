%% For CellReg Session 1 Size10data

clear all
%{
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\Size10data\CellReg1\cellRegistered_20190621_153023.mat')

close all

for i=size(cell_registered_struct.cell_to_index_map,1):-1:1
   
    
 plot_num=nnz(cell_registered_struct.cell_to_index_map(i,:)); 

 xyz=1;
 
 
 disp(i);
 
     if plot_num~=1
         
         figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])
 
         
%% Session 1
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M21_S18_mouse5_training_30042019\head_dir_mouse_5_training_leds2019-06-18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M21_S18_mouse5_training_30042019\Data_at_size10\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)

h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 2
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M39_S45_mouse_5_recent_context_A_01052019\edited\msCam_data_processed_refined.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M39_S45_mouse_5_recent_context_A_01052019\Size10_data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 3

if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\head_dir_mouse_5_recent_contextB_0205_leds2019-06-14T13_49_07.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\Size10_data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 4
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

 load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M46_S40_mouse_5_remote_context_A_28052019_repetition\head_dir_mouse_5_remote_contextA_2805_rep_leds2019-06-18T14_31_18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M46_S40_mouse_5_remote_context_A_28052019_repetition\size10data\msCam_data_processed.mat')


subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;


%% Session 5
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M3_S27_mouse_5_remote_context_B_29052019\head_dir_mouse_5_remote_contextB_2905_leds2019-06-14T13_58_50.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M3_S27_mouse_5_remote_context_B_29052019\size10data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 6
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M34_S9_mouse_5_remote_test_contextA_04062019\head_dir_mouse_5_remote_test_contextA_leds2019-06-13T12_18_18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M34_S9_mouse_5_remote_test_contextA_04062019\s8ize10data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;


%% Session 7
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M22_S8_mouse_5_context_B_remote-05062019\head_dir_mouse_5_remote_test_contextB_leds2019-06-13T13_38_29.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M22_S8_mouse_5_context_B_remote-05062019\size10data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;
 
    end
end

%}

%% For CellReg Session 2 Size10data

clear all

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\Size10data\CellReg2\cellRegistered_20190624_164829.mat')

close all

for i=size(cell_registered_struct.cell_to_index_map,1):-1:1
   
    
 plot_num=nnz(cell_registered_struct.cell_to_index_map(i,:)); 

 xyz=1;
 
 
 disp(i);
 
     if plot_num~=1
         
         figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])
 
         
%% Session 1
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M21_S18_mouse5_training_30042019\head_dir_mouse_5_training_leds2019-06-18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M21_S18_mouse5_training_30042019\Data_at_size10\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)

h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 2
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M39_S45_mouse_5_recent_context_A_01052019\edited\msCam_data_processed_refined.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M39_S45_mouse_5_recent_context_A_01052019\Size10_data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 3

if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\head_dir_mouse_5_recent_contextB_0205_leds2019-06-14T13_49_07.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M2_S29_mouse_5_recent_context_B_02052019\Size10_data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 4
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

 load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M46_S40_mouse_5_remote_context_A_28052019_repetition\head_dir_mouse_5_remote_contextA_2805_rep_leds2019-06-18T14_31_18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M46_S40_mouse_5_remote_context_A_28052019_repetition\size10data\msCam_data_processed.mat')


subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;


%% Session 5
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M3_S27_mouse_5_remote_context_B_29052019\head_dir_mouse_5_remote_contextB_2905_leds2019-06-14T13_58_50.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H16_M3_S27_mouse_5_remote_context_B_29052019\size10data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;

%% Session 6
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M34_S9_mouse_5_remote_test_contextA_04062019\head_dir_mouse_5_remote_test_contextA_leds2019-06-13T12_18_18.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M34_S9_mouse_5_remote_test_contextA_04062019\s8ize10data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;


%% Session 7
if cell_registered_struct.cell_to_index_map(i,xyz)~=0
    
x=cell_registered_struct.cell_to_index_map(i,xyz);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M22_S8_mouse_5_context_B_remote-05062019\head_dir_mouse_5_remote_test_contextB_leds2019-06-13T13_38_29.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_5\H14_M22_S8_mouse_5_context_B_remote-05062019\size10data\msCam_data_processed.mat')

subplot(2,4,xyz)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(xyz)])

end

xyz=xyz+1;
 
    end
end
