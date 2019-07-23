%Code to calculate the Stimulus signal as in Zaki's poster and to measure
%correlation coefficients betweeen fluyorescence measures and stimulus

%Initializing Variables
stimulus=(zeros(size(sigfn)));
PFD=stimulus;
sigma_s=30;
j=0;
sigt=sigfn;

%Converting to ang
theta1=circ_rad2ang(theta);
[m,n] = size(sigfn) ;
% idx = randperm(n) ; %Irrelevant, only for testing, ignore.
% b = sigfn ;     %Irrelevant, only for testing, ignore.

for i=1:size(sigfn,1) % You can also runit for specific neurons, just insert for i=[1 4 5 7 etc]

    j=j+1;  
    
    if theta1(i)<0
      
        theta1(i)=theta1(i)+360;
      
    end
    
%     sigt(i,:)=normalize(sigfn(i,:));   % Remove Comment if you want to normalize fluroescence measures    
      
    PFD(j,:)=theta1(i).*ones(1,size(head_dir,2));
    
%    b(i,idx) = sigfn(i,:);  %Irrelevant, only for testing, ignore.

    
% plot(sigt(i,:)+01*j);

    stimulus(j,:)=exp(-(head_dir-PFD(j)).^2/(2*sigma_s^2));
    
   [covar_measure1,covar_measure2]=corrcoef(stimulus(j,:),sigt(i,:)); 
   covar_measureR(j)=covar_measure1(1,2); 
   covar_measureP(j)=covar_measure2(1,2); 
   
   hold on
end

% covar_measure(j)=corr_coef(stimulus,sigfn); 
% ab1=transpose(stimulus);
% ab2=transpose(sigfn);
% 
% ab3=corrcoef(ab1,ab2);