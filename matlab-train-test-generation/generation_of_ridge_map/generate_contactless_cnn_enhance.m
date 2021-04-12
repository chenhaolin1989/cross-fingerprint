clear, close all;
clc

contactless_img_path='..\contactless_image\';
contactless_cnn_path='..\contactless_cnn\';
contactless_enhance_img_path='..\contactless_cnn_enhance\';


for num1=1:160
    for num2=1:6
	%% preprocessing
		img=imread([contactless_img_path,num2str(num1),'_',num2str(num2),'.bmp']);
        img=rgb2gray(img);img = adapthisteq(img,'NumTiles',[30 70],'clipLimit',0.01,'NBins',256,'Distribution','uniform');
        img_new = imresize(img, 0.25);img_new=imrotate(img_new,90);img_new1=img_new;
        [m,n] = size(img_new1);
		imagBW = img_new1;
		BW1 = edge(imagBW,'roberts',0.06); %0.04~0.07
	%% get center point and crop
		[x,y]=find(BW1'==1);
		last=length(x);
		y=sort(y);
        img_new=img_new(y(1)+1:384+y(1),:);
        img_new=imresize(img_new,0.5);
		imwrite(img_new,[contactless_cnn_path, num2str(num1),'_',num2str(num2),'.bmp']);
	%% Enhancement
		img=img_new;
		blkszeX = 8; thresh = 0.01; margin=0;
		[normim, mask] = ridgesegment(img, blkszeX, thresh, margin);
		[orientim, reliability] = ridgeorient(normim, 1, 5, 5);
		blksze = 10;
		[freq, medfreq] = ridgefreq(normim, mask, orientim, blksze, 3, 3, 10);
		freq = medfreq.*mask;
		newim = ridgefilter(normim, orientim, freq, 0.5, 0.5, 0);
		im=newim;
		im=(im-min(im(:)))/(max(im(:))-min(im(:)));
		imwrite(im,[contactless_enhance_img_path, num2str(num1),'_',num2str(num2),'.bmp']);
    end
end

