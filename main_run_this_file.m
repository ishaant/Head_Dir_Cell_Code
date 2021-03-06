clear all

%%% Full MIN1PIPE program ONLY MODIFY PARAMETERS HERE NOT ON MIN1PIPE %%%   

% This file will analyse the video and save outputs needed for the
% spike_finder, rayleigh plotting as well as CellReg

%% session-specific parameter initialization %% 
Fsi = 30;
Fsi_new = 30; %%% no temporal downsampling %%%
spatialr = 0.5; %%% no spatial downsampling %%%
se = 10; %%% structure element for background removal %%%
ismc = true; %%% run movement correction %%%
flag = 1; %%% use auto seeds selection; 2 if manual %%%
% isvis = true; %%% do visualize %%%
ifpost = true; %%% set true if want to see post-process %%%

%% main program %%
[fname, frawname, fregname] = min1pipe(Fsi, Fsi_new, spatialr, se, ismc, flag);

%% plot some images %%
load(fname)
figure(1)
clf
%%% raw max %%%
subplot(2, 3, 1, 'align')
imagesc(imaxn)
axis square
title('Raw')

%%% neural enhanced before movement correction %%%
subplot(2, 3, 2, 'align')
imagesc(imaxy)
axis square
title('Before MC')

%%% neural enhanced after movement correction %%%
subplot(2, 3, 3, 'align')
imagesc(imax)
axis square
title('After MC')

%%% contour %%%
subplot(2, 3, 4, 'align')
plot_contour(roifn, sigfn, seedsfn, imax, pixh, pixw)
axis square

%%% movement measurement %%%
subplot(2, 3, 5, 'align')
axis off
if ismc
    plot(raw_score); hold on; plot(corr_score); hold off;
    axis square
    title('MC Scores')
else
    title('MC skipped')
end

%%% all identified traces %%%
subplot(2, 3, 6, 'align')
sigt = sigfn;
for i = 1: size(sigt, 1)
    sigt(i, :) = normalize(sigt(i, :));
end
plot((sigt + (1: size(sigt, 1))')')
axis tight
axis square
title('Traces')


%% make a movie %%

load(fname)
mraw = matfile(frawname);
mreg = matfile(fregname);
id = find(fname == filesep, 1, 'last');
fmovie = [fname(1: id), 'demo_vid.avi'];
v = VideoWriter(fmovie);
v.FrameRate = Fsi_new;
v.Quality = 100;
open(v)

%%% compute batch %%%
ttype = class(mraw.frame_all(1, 1, 1));
stype = parse_type(ttype);
dss = 2;
dst = 2;
nf = size(sigfn, 2);
nsize = pixh * pixw * nf * stype * 6 / (dss ^ 2); %%% size of single %%%
nbatch = batch_compute(nsize);
ebatch = ceil(nf / nbatch);
idbatch = [1: ebatch: nf, nf + 1];
nbatch = length(idbatch) - 1;

%%% make movie %%%
figure(2)
set(gcf, 'Units', 'normalized', 'position', [0.5, 0.1, 0.8, 0.8])
for ii = 1: nbatch
    dataraw = mraw.frame_all(1: dss: pixh, 1: dss: pixw, idbatch(ii): idbatch(ii + 1) - 1);
    datareg = mreg.reg(1: dss: pixh, 1: dss: pixw, idbatch(ii): idbatch(ii + 1) - 1);
    datar = reshape(roifn * sigfn(:, idbatch(ii): idbatch(ii + 1) - 1), pixh, pixw, []);
    datar = datar(1: dss: end, 1: dss: end, :);
    for i = 1: dst: size(dataraw, 3)
        if i==1
        clf
        subplot(1, 3, 1, 'align')
        imagesc(dataraw(:, :, i + idbatch(ii) - 1), [0, 1])
        axis off
        axis square
        lim1=axis;
        title('Raw')
        
        subplot(1, 3, 2, 'align')
        imagesc(datareg(:, :, i + idbatch(ii) - 1))
        axis off
        axis square
        lim2=axis;
        title('After MC')
        
        subplot(1, 3, 3, 'align')
        imagesc(datar(:, :, i + idbatch(ii) - 1))
        axis off
        axis square
        lim3=axis;
        title('Processed')
        
        
        else
                       
        clf
        subplot(1, 3, 1, 'align')
        imagesc(dataraw(:, :, i + idbatch(ii) - 1), [0, 1])
        axis(lim1)
        axis off
        axis square
        title('Raw')
        
        subplot(1, 3, 2, 'align')
        imagesc(datareg(:, :, i + idbatch(ii) - 1), [0, 1])
        axis(lim2)
        axis off
        axis square
        title('After MC')
        
        subplot(1, 3, 3, 'align')
        imagesc(datar(:, :, i + idbatch(ii) - 1), [0, 1])
        axis(lim3)
        axis off
        axis square
        title('Processed')
        
        pause(0.02)
        
        movtmp = getframe(gcf);
        writeVideo(v, movtmp);

        end
       disp(i) 
    end
end
close(v)
%% post-process %%
if ifpost
    real_neuron_select
end

%% Saving cell Reg input

            load(uigetfile)
            file_name_to_save_cellreg = [fname(1: id), 'cell_reg_final'];
            cellreg_inp=reshape(roifnr,240,376,size(roifnr,2));
            cellreg_inp=permute(cellreg_inp,[3 1 2]);
            save(file_name_to_save_cellreg, 'cellreg_inp');
