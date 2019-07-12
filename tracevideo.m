vobj = VideoWriter('alltracevid','Motion JPEG AVI');
vobj.FrameRate = 30;  %just to be cinematic 
vobj.Quality=100; %no compression
open(vobj); 

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\size10data\combineddata.mat')


 siga=sigfn;

sth=figure('Position', [100 100 1242 300])

for i=1:size(sigfn,1)
siga(i,:)=normalize(siga(i,:));
end

for k = 1:size(sigfn,2)
    j=0;
    
    for i=[2 3 4 5 7 11 14 15 16 17]
    
        j=j+1;
        
        x=1:k;
    
        x=x/30;
    
        plot(x,j+siga(i,1:k),'LineWidth',2);

    
        axis([0,250,-0.5,11])
    
    
        hold on

    end
    
    frame = getframe(sth); %get image of whats displayed in the figure
    writeVideo(vobj, frame);
    clf    
    
end
%close the object so its no longer tied up by matlab
 close(vobj);
 close(gcf) %close figure since we don't need it anymore


 
%  
%  for k =size(sigfn,2)
%     for i=1:size(sigfn,1)
%         
%     x=1:k;
%     x=x/30;
%     plot(x,i+siga(i,1:k),'LineWidth',2);
%     axis([0,250,-0.5,15])
%     hold on
%     end
% 
% end
 