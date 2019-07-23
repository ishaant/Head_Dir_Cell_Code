%Select the file for which you want to plot Contour and Traces
[fname, pname]=uigetfile;

%Create fully-formed filename as a string
filename = fullfile(pname, fname);
id = find(fname == '.', 1, 'last');

load(filename);

% Command to plot contours
figure;plot_contourish(roifn, sigfn, seedsfn, imax, pixh, pixw);
% Command to plot traces

figure

for i=1:size(sigfn,1)

    plot(sigfn(i,:)+01*i);
    legend;
    hold on
    
end