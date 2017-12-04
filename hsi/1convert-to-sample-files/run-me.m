
%Conver the mat format dataset into seperated samples.
%Each file stores a sample which is a 5x5xN matrix

outputdir='../PaviaU/samples/';
% %%%%%%%%%%  Salinas  %%%%%%%%%%%%%%%%%
% load('Salinas_corrected.mat');
% load('Salinas_gt.mat');
% hsi=salinas_corrected;
% gt=salinas_gt;

% %%%%%%%%%%  Indian  %%%%%%%%%%%%%%%%%
% load('../public-data/Indian_pines_corrected.mat');
% load('../public-data/Indian_pines_gt.mat');
% hsi=indian_pines_corrected;
% gt=indian_pines_gt;

%%%%%%%%%%  PaviaU  %%%%%%%%%%%%%%%%%
load('../public-data/PaviaU.mat');
load('../public-data/PaviaU_gt.mat');
hsi=paviaU;
gt=paviaU_gt;

%normalize cube
cube = zeros(size(hsi));
for ch=1:size(hsi,3)
    minval = min(min(hsi(:,:,ch)));
    maxval = max(max(hsi(:,:,ch)));
    cube(:,:,ch) = (hsi(:,:,ch)-minval)/(maxval-minval);
end
%convert the values in range [0,255] and store the data in UINT8 format
cube = uint8(cube * 255);

for labelid=1:9 %for each class
    %find the positions for pixels of class 'labelid'
    [rowidx, colidx] = find(gt == labelid);
    
    disp(labelid);   
    
    for ii=1:length(rowidx)
        pos_y = rowidx(ii);
        pos_x = colidx(ii);
        subcube0 = getsubcube(cube, pos_y, pos_x, 5);
        
        %data augmentation
        subcube1 = imrotate(subcube0, 90);
        subcube2 = imrotate(subcube0, 180);
        subcube3 = imrotate(subcube0, 270);
        
        subcube4 = flip(subcube0);
        subcube5 = flip(subcube1);
        subcube6 = flip(subcube2);
        subcube7 = flip(subcube3);
        
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-0.bin'];
        writesubcube(subcube0, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-1.bin'];
        writesubcube(subcube1, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-2.bin'];
        writesubcube(subcube2, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-3.bin'];
        writesubcube(subcube3, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-4.bin'];
        writesubcube(subcube4, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-5.bin'];
        writesubcube(subcube5, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-6.bin'];
        writesubcube(subcube6, pos_y, pos_x, filename);
        filename = [outputdir, 'pixel5x5-cls', num2str(labelid), '-', num2str(ii), '-7.bin'];
        writesubcube(subcube7, pos_y, pos_x, filename);
    end
end



