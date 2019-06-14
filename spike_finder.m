%% Selecting the Min1Pipe output for the required session

[fname, pname]=uigetfile('*.mat','Select the mscam_refined data for the desired session','msCam_data_processed_refined');

%Create fully-formed filename as a string
filename = fullfile(pname, fname);

load(filename)


%% Initializing  variables and normalizing spike intensities
    
    siga = sigfn;

    xloc=zeros(size(siga, 1),100);
    yloc=zeros(size(siga, 1),100);
    

for i = 1: size(siga, 1)
    siga(i, :) = normalize(siga(i, :));
end
for i = 1: size(siga, 1)
    sigt(i,:) =downsample(siga(i,:),30);
end

    
    %% Finding Significant Spikes
    
for i = 1: size(sigt, 1)
    abc=sigt(i,:);
    
    [peak,loc]= findpeaks(sigt(i,:),'MinPeakDistance',2,'MinPeakProminence',2*std(sigt(i,:))); %check these parameters
    
    for j=1:size(peak,2)
        xloc(i,j)=loc(j);
        yloc(i,j)=peak(j);
    end

end

%%Plot of downsampled traces

plot((sigt + (1: size(sigt, 1))')')
axis tight
axis square
title('Traces')

%% Saving the spike locations

uisave({'xloc','yloc','sigfn','siga'},'spike_locations_')
