sigt=[];
for i=1:size(sigfn,1)
    
    sigt(i,:)=downsample(sigfn(i,:),10);

end

raster=zeros(size(sigfn));
TF=[];
for i=1:size(sigfn,1)

    TF(i,:) = isoutlier(sigfn(i,:),'mean','ThresholdFactor',2);

    %{
%     for j=1:nnz(loc)
%          raster(i,loc(j))=1;
%     end
%     for j=1:size(sigt,2)
%         if sigt(i,j)>threshold(i)
%             raster(i,j)=1;
%         end
%     end
    %}

end

x = linspace(1,size(sigfn,1),size(sigfn,1));            
L=logical(TF);
figure
% TF1=L([1 12 3 10 17 18 19 5 31 7 9 4],:);
% TF1=L([6 10 11 12 13 14 15 16 18 5 7 17],:);
 %TF1=L([1:end 4 19],:);
% TF1=L([1:end 2 5 7 17],:);
 TF1=L([1:end 4 19],:);
plotSpikeRaster(TF1,'PlotType','vertline','VertSpikeHeight',0.4);
%TF1=L([1 12 3 10 17 18 19 5 31 7 9 4],:);
yticks(x)
