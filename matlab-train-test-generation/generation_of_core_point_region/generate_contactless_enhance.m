clear, close all;
clc
contactless_center_path='..\contactless_center_data\';

for num1=1:160
    for num2=1:6      
        img=imread([contactless_center_path,'contactless_scale\',num2str(num1),'_',num2str(num2),'.bmp']);
blkszeX = 8; thresh = 0.01; margin=0;
[normim, mask] = ridgesegment(img, blkszeX, thresh, margin);
[orientim, reliability] = ridgeorient(normim, 1, 5, 5);
blksze = 10;
[freq, medfreq] = ridgefreq(normim, mask, orientim, blksze, 3, 3, 10);
freq = medfreq.*mask;

newim = ridgefilter(normim, orientim, freq, 0.5, 0.5, 0);
im=newim;
im=(im-min(im(:)))/(max(im(:))-min(im(:)));
        imwrite(im,[contactless_center_path,'contactless_scale_en\', num2str(num1),'_',num2str(num2),'.bmp']);
    end
end

