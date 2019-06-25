%%
close all


%%
for x=50:50

    
neuron=x;

disp(x);

bin_size=30;

head_dir_binned=(ceil(head_dir/bin_size)+floor(head_dir/bin_size))*bin_size/2;

min_array_size=min(size(head_dir_binned,2),size(sigfn,2));

head_dir_binned=(head_dir_binned(1:min_array_size));

sigfn=sigfn(1:end,1:min_array_size);

bin_number=360/bin_size;
count=zeros(bin_number,1);

WA=zeros(bin_number,1);
norm1=WA;
WA_unnormed=WA;
angle=WA;
sigma_t=100;


%%
for i=1:bin_number
    
    angle(i)=(2*i-1)*bin_size/2;
    
    for j=1:length(head_dir_binned)
        
        if head_dir_binned(j)==angle(i) && (j==length(head_dir_binned) || head_dir_binned(j+1)~=angle(i))
                    
                count(i)=count(i)+1;           
            
            
        end
        
        
    end
    
    t_b_in{i}=zeros(count(i),1);
    t_b_f=t_b_in;
end

%%

for i=1:bin_number
    
    angle(i)=(2*i-1)*bin_size/2;
    
    indx1=1;    
    indx2=1;    
    
    for j=1:length(head_dir_binned)
        
        
        if head_dir_binned(j)==angle(i)
            
            if j==1 || head_dir_binned(j-1)~=angle(i)
                
                t_b_in{i}(indx1)=j;
                indx1=indx1+1;                
                
            end           
            
            
            if j==length(head_dir_binned) || head_dir_binned(j+1)~=angle(i)
                    
                t_b_f{i}(indx2)=j;
                indx2=indx2+1;
            
            end
        end
        
        
    end
    
end

%%


for i=1:bin_number

    for j=1:count(i)
        
        for k=t_b_in{i}(j):t_b_f{i}(j)

            t=k-t_b_in{i}(j)+1;
            
          WA_unnormed(i)=WA_unnormed(i)+(1-exp(-1*t^2/(2*sigma_t^2)))*sigfn(neuron,k);
           norm1(i)=norm1(i)+(1-exp(-1*t^2/(2*sigma_t^2)));            
        end
        
        WA(i)=WA_unnormed(i)/norm1(i);
        
    end
    
    
end
%%
figure
polarplot(pi()/180.*angle([1:end,1]),WA([1:end 1]))
hold on
WA_x=WA.*cos(pi()/180.*angle);
WA_y=WA.*sin(pi()/180.*angle);

theta=atan(sum(WA_y)/sum(WA_x));

    if sum(WA_x)<0
       
        theta=theta+pi;
       
    end


magn=sqrt((sum(WA_x))^2+(sum(WA_y))^2);

temp=max(WA);
rl=max(magn,temp);

polarplot([0,theta],[0,magn])
%rlim([0 0.5])
title(['Neuron No.= ' num2str(x)])
hold off
end