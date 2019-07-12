%% This code takes the relevant HD file and CellReg ooutput and accordingly
% plots fluorescence measures for neurons across sessions


clear all
%%  Select the relevant CellReg file with index of cells
% For Mouse61 CellReg Session 1

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\size10data\cell reg jose with cell reg final\cellRegistered_20190702_101801.mat')

close all

for i=size(cell_registered_struct.cell_to_index_map,1):-1:1 %For all neurons detected in CellReg
 %You can change the entry of the loop if you want to see lesser neurons
        
 plot_num=nnz(cell_registered_struct.cell_to_index_map(i,:)); %Total number of sessions the neuron was present in
 
 plotindx=1;  %Used as a marker to index the position of each neuron subplot according to session
              % changed the name from xyz to plot indx
 
 disp(i);     %Just as a countdown to get an idea of time left    
 
 
 %Criteria for the number of sessions a neuron must be detected in for it
 %to be analysed in this program. Use (if plot_num>0) for all neurons 
     if plot_num==3         
         
         figure('units','normalized','outerposition',[0.2 0.2 0.7 0.7])
 
         
%% Session 1
if cell_registered_struct.cell_to_index_map(i,plotindx)~=0  %Checks if neuron is present in this session
    
x=cell_registered_struct.cell_to_index_map(i,plotindx); % Collect the index of the neuron according to the number assigned in MIN1PIPE

%Load the relevant HD Data for the session
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\head_dir_mouse61_training_leds2019-06-19T16_47_41.mat')
%Load the relevant calcium traces for the ssession
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\size10data\combineddata_refined.mat')

% Make a subplot. The first two indices specify the number of rows and
% columns respectively in the subplot. The third  index gives the position
% for this specific subplot. May need to change first two entries according
% to number of sessions in CellReg
subplot(1,3,plotindx)


%Call the function to calculate the flurorescence activity of each cell as
%a function of head direction
PFD_calc_fun(x,head_dir,sigfn)

h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(plotindx)])   %Appends Session Number to the Title of the subplot

end

plotindx=plotindx+1;

%% Session 2    %For docimentation refer to Session 1
if cell_registered_struct.cell_to_index_map(i,plotindx)~=0
    
x=cell_registered_struct.cell_to_index_map(i,plotindx);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M49_S10_mouse61_recent_context_A_12062019\head_dir_mouse61_recent_contextA_leds2019-06-19T16_56_29.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M49_S10_mouse61_recent_context_A_12062019\size10data\msCam_data_processed_refined.mat')

subplot(1,3,plotindx)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(plotindx)])

end

plotindx=plotindx+1;

%% Session 3

if cell_registered_struct.cell_to_index_map(i,plotindx)~=0
    
x=cell_registered_struct.cell_to_index_map(i,plotindx);

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M46_S3_mouse_61_recent_context_B_13062019\head_dir_mouse61_recent_contextB_leds2019-06-19T17_09_17.mat')
load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H11_M46_S3_mouse_61_recent_context_B_13062019\size10data\msCam_data_processed_refined.mat')

subplot(1,3,plotindx)

PFD_calc_fun(x,head_dir,sigfn)
h = get(gca, 'Title');
origtitle = get(h,'String');
set(h,'String',[origtitle ' Session#' num2str(plotindx)])

end

plotindx=plotindx+1;
 
    end
end