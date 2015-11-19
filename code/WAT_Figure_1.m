%%% CODE FOR RECREATING WAT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%
%%% This .m file contains the script to recreate Figure 1 in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder and
%%% puts the png image in the  ../figures/ folder.
%%% FIGURE 1 :  Compare Two Subjects - Axial slices

% clean slate
clear all; close all; clc;

code_path   = fileparts(mfilename('fullpath'));
data_path   = sprintf('%s/../data_output', code_path);
figure_path = sprintf('%s/../figures', code_path);

subject_list = {'S10','S24'};

for sIdx = 1:length(subject_list)
    
    subject_num = subject_list{sIdx};
    
    subject_images = load(sprintf('%s/%s_output.mat',data_path,subject_num));
        
    rows = 170:350;
    cols = 135:393;
    
    if strcmp(subject_num,'S10')
        
        S10_slx = 4;
        
        eval(sprintf('%s_mask = subject_images.%s_warm_Mask_Registered;',subject_num,subject_num));
        eval(sprintf('%s_FSF  = subject_images.%s_warmMRI_FSF_Registered;',subject_num,subject_num));
        eval(sprintf('%s_HUs  = subject_images.%s_warmCT_HU_Registered;',subject_num,subject_num));
        
        clear subject_images
        
        eval(sprintf('%s_mask_1slx = %s_mask(:,:,S10_slx);',subject_num,subject_num));
        eval(sprintf('%s_FSF_1slx  = %s_FSF(:,:,S10_slx)./10;',subject_num,subject_num));
        eval(sprintf('%s_HUs_1slx  = %s_HUs(:,:,S10_slx);',subject_num,subject_num));
        

    elseif strcmp(subject_num,'S24')
        
        S24_slx = 5;
        
        eval(sprintf('%s_mask = subject_images.%s_warm_Mask_Registered;',subject_num,subject_num));
        eval(sprintf('%s_FSF  = subject_images.%s_warmMRI_FSF_Registered;',subject_num,subject_num));
        eval(sprintf('%s_HUs  = subject_images.%s_warmCT_HU_Registered;',subject_num,subject_num));
        
        clear subject_images
        
        eval(sprintf('%s_mask_1slx = %s_mask(:,:,S24_slx);',subject_num,subject_num));
        eval(sprintf('%s_FSF_1slx  = %s_FSF(:,:,S24_slx)./10;',subject_num,subject_num));
        eval(sprintf('%s_HUs_1slx  = %s_HUs(:,:,S24_slx);',subject_num,subject_num));

    end
end

%% Save out the images

fig_size_inches = 3;
fig_dpi = 300;
fig_pixels = fig_size_inches * fig_dpi;
subplot_left_right_pad = 0.05;
subplot_top_bottom_pad = 0.05;
FontSize = 32;
FontWeight = 'bold';
LineWidth = 2;

%% S24 images

% S24 FSF
hf = figure(1); 
set(hf,'Color',[1 1 1],'Position',[100 100 fig_pixels*1.1 fig_pixels*.90]);
subplot('Position',[subplot_left_right_pad subplot_top_bottom_pad 1-2*subplot_left_right_pad 1-2*subplot_top_bottom_pad]);
imagesc(S24_FSF_1slx(rows,cols)); colormap(IDLrainbow2); caxis([0 100]); axis image;
set(gca,'xtick',[],'ytick',[],'box','off');
hc = colorbar;
set(hc,'box','off','LineWidth',LineWidth,'FontSize',FontSize);
ht = title(sprintf('Female, 23 y.o.\nBMI = 21.1'));
hy = ylabel('MRI FSF [%]');
set(ht,'Color',[0 0 0],'FontSize',FontSize,'FontWeight',FontWeight);
set(hy,'Color',[0 0 0],'FontSize',FontSize,'FontWeight',FontWeight);

% S24 HU
hf = figure(2); 
set(hf,'Color',[1 1 1],'Position',[100 100 fig_pixels*1.1 fig_pixels*.90]);
subplot('Position',[subplot_left_right_pad subplot_top_bottom_pad 1-2*subplot_left_right_pad 1-2*subplot_top_bottom_pad]);
imagesc(S24_HUs_1slx(rows,cols)); colormap(bone); caxis([-300 300]); axis image;
set(gca,'xtick',[],'ytick',[],'box','off');
hy = ylabel('CT HU');
set(hy,'Color',[0 0 0],'FontSize',FontSize,'FontWeight',FontWeight);
hc = colorbar;
set(hc,'box','off','LineWidth',LineWidth,'FontSize',FontSize);

% S24 Mask
hf = figure(3);
set(hf,'Color',[1 1 1],'Position',[100 100 fig_pixels*1.1 fig_pixels*.90]);
subplot('Position',[subplot_left_right_pad subplot_top_bottom_pad 1-2*subplot_left_right_pad 1-2*subplot_top_bottom_pad]);
imagesc(S24_mask_1slx(rows,cols)); colormap(gray); caxis([0 1]); axis image;
set(gca,'xtick',[],'ytick',[],'box','off');
hy = ylabel('WAT Mask');
set(hy,'Color',[0 0 0],'FontSize',FontSize,'FontWeight',FontWeight);
hc = colorbar;
set(hc,'YTick',[0 1],'box','off','FontSize',FontSize);

%% S10 images

% S10 FSF
hf = figure(4); 
set(hf,'Color',[1 1 1],'Position',[100 100 fig_pixels*1.1 fig_pixels*.90]);
subplot('Position',[subplot_left_right_pad subplot_top_bottom_pad 1-2*subplot_left_right_pad 1-2*subplot_top_bottom_pad]);
imagesc(S10_FSF_1slx(rows,cols)); colormap(IDLrainbow2); caxis([0 100]); axis image;
set(gca,'xtick',[],'ytick',[],'box','off');
hc = colorbar;
set(hc,'box','off','LineWidth',LineWidth,'FontSize',FontSize);
ht = title(sprintf('Female, 34 y.o.\nBMI = 27.5'));
set(ht,'Color',[0 0 0],'FontSize',FontSize,'FontWeight',FontWeight);

% S10 HU
hf = figure(5); 
set(hf,'Color',[1 1 1],'Position',[100 100 fig_pixels*1.1 fig_pixels*.90]);
subplot('Position',[subplot_left_right_pad subplot_top_bottom_pad 1-2*subplot_left_right_pad 1-2*subplot_top_bottom_pad]);
imagesc(S10_HUs_1slx(rows,cols)); colormap(bone); caxis([-300 300]); axis image;
set(gca,'xtick',[],'ytick',[],'box','off');
hc = colorbar;
set(hc,'box','off','LineWidth',LineWidth,'FontSize',FontSize);

% S10 Mask
hf = figure(6); 
set(hf,'Color',[1 1 1],'Position',[100 100 fig_pixels*1.1 fig_pixels*.90]);
subplot('Position',[subplot_left_right_pad subplot_top_bottom_pad 1-2*subplot_left_right_pad 1-2*subplot_top_bottom_pad]);
imagesc(S10_mask_1slx(rows,cols)); colormap(gray); caxis([0 1]); axis image;
set(gca,'xtick',[],'ytick',[],'box','off');
hc = colorbar;
set(hc,'YTick',[0 1],'box','off','FontSize',FontSize);

%% Make montage image

fr1 = getframe(figure(1));
im1 = frame2im(fr1);

fr2 = getframe(figure(2));
im2 = frame2im(fr2);

fr3 = getframe(figure(3));
im3 = frame2im(fr3);

fr4 = getframe(figure(4));
im4 = frame2im(fr4);

fr5 = getframe(figure(5));
im5 = frame2im(fr5);

fr6 = getframe(figure(6));
im6 = frame2im(fr6);

imwrite([im1 im4; im2 im5; im3 im6],sprintf('%s/Figure_1.png',figure_path));

%%

close all


