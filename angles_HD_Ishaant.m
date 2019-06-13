
clc
[fname, pname]=uigetfile('*.csv');

%Create fully-formed filename as a string
filename = fullfile(pname, fname);

a=load(filename);

a(a==0)=NaN; %replace zeros for NaN

    for i=1:size(a,2)
        a(:,i) = FillNaNgaps(a(:,i));%replace NaN with average close numbers
    end
    
m=[];

for i=1:length(a)
    
    m(i)=(((a(i,4)-a(i,2))./(a(i,3)-a(i,1))));%calculate the slope

    
     c(i)=atand(m(i));
    
    if a(i,3)<a(i,1)
        if a(i,4)>a(i,2)
     
            c(i)=c(i)+360;
        end
    end
            
    if a(i,3)>a(i,1)
    
        c(i)=c(i)+180;
        
    end
    
end

hist(c)
figure
rose(c.*(2*pi()/360),40)
figure
polarhistogram(c.*(2*pi()/360),40)
head_dir=c;

uisave('head_dir',['head_dir_', fname])

%  file_name_to_save_angles = [path_name, file_base{i}, '_cellreg_input.mat'];
%             cellreg_inp=reshape(roifnr,240,376,size(roifnr,2));
%             save(file_name_to_save_cellreg, 'cellreg_inp');
% 
