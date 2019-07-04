vobj = VideoWriter('dummyvid1','Motion JPEG AVI');
vobj.FrameRate = 30;  %just to be cinematic 
vobj.Quality=100; %no compression
open(vobj); 

load('D:\CasanovaJP\2019\data\ADn_project\mouse_61\H12_M6_S51_Mouse61_training_context_A_11062019\size10data\combineddata_refined.mat')


sth=figure('Position', [100 100 1242 300])

for k = 1:size(sigfn,2)
    x=1:k;
    x=x/30;
    plot(x,sigfn(17,1:k));
    axis([0,250,-0.5,1.7])
    hold on
    plot(x,sigfn(7,1:k));
    drawnow
    frame = getframe(sth); %get image of whats displayed in the figure
    writeVideo(vobj, frame);
    clf

end
%close the object so its no longer tied up by matlab
 close(vobj);
 close(gcf) %close figure since we don't need it anymore
