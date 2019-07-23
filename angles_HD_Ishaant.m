% This file takes the coordinates data from the Bonsai Analysis of head
% Directoin LEDs, calculates the corresponding angle, for each frame, and
% saves the angle data in a mat filoe format

% We also plot histograms (both normal and polar) to better vuisualisse the
% distribution of the head direction

clc

% Selecting the relevant HD file from Bonsai

[fname, pname]=uigetfile('*.csv');

%% Stuff to make saving easier

%Create fully-formed filename as a string
filename = fullfile(pname, fname);
id = find(fname == '.', 1, 'last');

% Loads the file as 'a'
a=load(filename);

%% Fixing frames where we lost HD Data by averaging between adjacent frames

a(a==0)=NaN; %replace zeros for NaN

    for i=1:size(a,2)
        a(:,i) = FillNaNgaps(a(:,i));%replace NaN with average close numbers
    end
    
    
%% Calculating angles
    
m=[];
for i=1:length(a)
    
    m(i)=(((a(i,4)-a(i,2))./(a(i,3)-a(i,1))));%calculate the slope

    
     c(i)=atand(m(i));
    
     %Expanding the range from (-90 to 90) to (0 to 360)
    
    if a(i,3)<a(i,1)
        if a(i,4)>a(i,2)
     
            c(i)=c(i)+360;              
        end
    end
            
    if a(i,3)>a(i,1)
    
        c(i)=c(i)+180;
        
    end
    
end

figure
hist(c)
figure
rose(c.*(2*pi()/360),40)    %Input is needed in radians
figure
polarhistogram(c.*(2*pi()/360),40)

head_dir=c;

uisave('head_dir',['head_dir_', fname(1:id-1)])

