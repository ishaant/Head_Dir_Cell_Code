stimulus=(zeros(size(sigfn)));
PFD=stimulus;
sigma_s=30;
j=0;
theta1=circ_rad2ang(theta);

sigt=sigfn;

[m,n] = size(sigfn) ;
idx = randperm(n) ;
b = sigfn ;

for i=1:size(sigfn,1)

    j=j+1;

    if theta1(i)<0
    theta1(i)=theta1(i)+360;
    end
    
%     sigt(j,:)=normalize(sigfn(j,:));    
    PFD(j,:)=theta1(i).*ones(1,size(head_dir,2));
    
    b(i,idx) = sigfn(i,:);

    
% plot(sigt(i,:)+01*i);

    stimulus(j,:)=exp(-(head_dir-PFD(j)).^2/(2*sigma_s^2));
    
   [covar_measure1,covar_measure2]=corrcoef(stimulus(j,:),sigfn(i,:)); 
   covar_measureR(j)=covar_measure1(1,2); 
   covar_measureP(j)=covar_measure2(1,2); 
   
   hold on
end

% covar_measure(j)=corr_coef(stimulus,sigfn); 
ab1=transpose(stimulus);
ab2=transpose(sigfn);

ab3=corrcoef(ab1,ab2);