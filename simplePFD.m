%%Standalone script similar to the function PFD_calc_fun 

%I use this to troubleshoot the function


close all


bin_size=6; %Specify the desired Bin Size (Only take even divisors of 360)

bin_number=360/bin_size; %Calculates total number of bins

sigma_t=10;


head_dir_binned=(ceil(head_dir/bin_size)+floor(head_dir/bin_size))*bin_size/2; %Bin the angular data we have. This assigns each data the mean value opf the bin (For e.g 15 if the bin is 0-30)


%Just trimming the data so that we have a uniform timeframe

min_array_size=min(size(head_dir_binned,2),size(sigfn,2)); 
head_dir_binned=(head_dir_binned(1:min_array_size)); 
head_dir=(head_dir(1:min_array_size)); 
sigfn=sigfn(1:end,1:min_array_size);

% contrl=zeros(size(sigfn,1),bin_number); %For troubleshooting

%% Looping and plotting for each neuron

for x=size(sigfn,1):-1:1  % You can change the range of x if you dont want the complete output each time

    
neuron=x;

disp(x);




%Initilaizing some variables
count=zeros(bin_number,1);
WA=zeros(bin_number,1);
norm1=WA;
WA_unnormed=WA;
angle=WA;



%% Calculating number of passages through each angular bin

for i=1:bin_number  %i is an index of each bin
    
    angle(i)=(2*i-1)*bin_size/2;
    
    for j=1:length(head_dir_binned)
        
        if head_dir_binned(j)==angle(i) && (j==length(head_dir_binned) || head_dir_binned(j+1)~=angle(i))
                    
                count(i)=count(i)+1;           
            
            
        end
        
        
    end
    
    %Intializing variables to store the timepoints at whichh each passage
    %through a bin starts and stop
    t_b_in{i}=zeros(count(i),1);   
    t_b_f=t_b_in;
    
end

%% Storing the timepoints at which each passage through a bin starts and 
% stops

for i=1:bin_number
    
    angle(i)=(2*i-1)*bin_size/2;
    
    indx1=1;    
    indx2=1;    
    
    for j=1:length(head_dir_binned)
        
        
        if head_dir_binned(j)==angle(i)
            
            if j==1 || head_dir_binned(j-1)~=angle(i)
                
                t_b_in{i}(indx1)=j;  %Storing the start of the passage
                indx1=indx1+1;                
                
            end           
            
            
            if j==length(head_dir_binned) || head_dir_binned(j+1)~=angle(i)
                    
                t_b_f{i}(indx2)=j; %Storing the end of the passage
                indx2=indx2+1;
            
            end
        end
        
        
    end
    
end

% Each t_b_in(i)(and t_b_f(i)) is a different size (ac to no. of passages 
% through that bin)

%%

%Diffreent Formula to weigh fluorescence measures
%{
%      for i=1:bin_number
%  
%          for j=1:count(i)
%  
%              for k=t_b_in{i}(j):t_b_f{i}(j)
%  
%                  t=k-t_b_in{i}(j)+1;
%  
%                WA_unnormed(i)=WA_unnormed(i)+10^sigfn(neuron,k);
%                 norm1(i)=t;            
%              end
%  
%              WA(i)=WA(i)+WA_unnormed(i)/norm1(i);
%  
%          end
%          
%          WA(i)=WA(i)/count(i);
%  
%  
%      end
%}


% Implementation of Zaki's formula for weighing fluoresnce measures of each
% neuron as a function of passages across angular bins and the time spent therewith 

      for i=1:bin_number %Looping through bins
 
          for j=1:count(i)  %Looping through passages
  
              for k=t_b_in{i}(j):t_b_f{i}(j) % duration of passage
  
                  t= k-t_b_in{i}(j)+1; %Time from start of passage
  
                WA_unnormed(i)=WA_unnormed(i)+sigfn(neuron,k);  %Implementation of the function in the poster
                            %Calculating the normalising factor
              end
              norm1(i)=norm(i)+t; 
  
              WA(i)=WA(i)+WA_unnormed(i)/t;
  
          end
          
           WA(i)=WA(i)/count(i);  %Averaging by total number of passages
  
  
     end
%%
% contrl(x,:)=WA;  %For troubleshooting

figure
polarplot(pi()/180.*angle([1:end,1]),WA([1:end 1]))
hold on

%To calculate the resultat fluorescence vector from binned data

WA_x=WA.*cos(pi()/180.*angle);
WA_y=WA.*sin(pi()/180.*angle);

theta(x)=atan(sum(WA_y)/sum(WA_x));
    if sum(WA_x)<0
       
        theta(x)=theta(x)+pi;
       
    end


magn=sqrt((sum(WA_x)/sum(WA))^2+(sum(WA_y)/sum(WA))^2);
 
% %For plotting range
% temp=max(WA);
% rl=max(magn,temp);
% %For Calcualting Rayleigh Vector
% r(x)=circ_r(circ_ang2rad(angle), WA, circ_ang2rad(bin_size));
% rayl(x)=sum(WA)*r(x);

% Plotting thwe resultant
polarplot([0,theta(x)],[0,magn])

title(['Neuron No.= ' num2str(x)])
hold off
%% Rayleigh Test Parameters (Not needed/can be commented out)
[pval,zval]=circ_rtest(circ_ang2rad(angle), WA, circ_ang2rad(bin_size));

p(x)=pval;
z(x)=zval;

end