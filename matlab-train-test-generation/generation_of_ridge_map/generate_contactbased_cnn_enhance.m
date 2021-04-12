clear, close all;
clc

contactbased_img_path='..\contactbased_image\';
contactbased_cnn_path='..\contactbased_cnn\';
contactbased_enhance_img_path='..\contactbased_cnn_enhance\';

for num1=1:160
    for num2=1:6
	%% preprocessing and crop
		img=imread([contactbased_img_path,num2str(num1),'_',num2str(num2),'.bmp']);
        [x,y]=find(img~=255);x=sort(x);
        up=x(1)-1;down=356-x(end);
        if up+down<1
            img_new=img(15:342,:);
        else
            uppixel=floor(28*up/(up+down)); downpixel=28-uppixel;
            img_new=img(uppixel+1:356-downpixel,:);
        end
        [sizex,sizey]=size(img_new);
        if sizex~=328 || sizey~=328 
            flag=flag+1;
        end
        img_new=fliplr(img_new);
        img_new=imresize(img_new,24/41);
        imwrite(img_new,['...\contactbased_cnn\', num2str(num1),'_',num2str(num2),'.bmp']);
	%% Enhancement	
		img=img_new;
         blksze = 8; thresh = 0.01; margin=0;
		[normim, mask] = ridgesegment(img, blksze, thresh, margin);
		[orientim, reliability] = ridgeorient(normim, 1, 5, 5);
		blksze = 8;
		[freq, medfreq] = ridgefreq(normim, mask, orientim, blksze, 3, 3, 10);
		freq = medfreq.*mask;
		newim = ridgefilter(normim, orientim, freq, 0.5, 0.5, 0);im=newim;
		im=(im-min(im(:)))/(max(im(:))-min(im(:))); im=1-im;
        imwrite(im,[contactbased_enhance_img_path, num2str(num1),'_',num2str(num2),'.bmp']);
    end
end

