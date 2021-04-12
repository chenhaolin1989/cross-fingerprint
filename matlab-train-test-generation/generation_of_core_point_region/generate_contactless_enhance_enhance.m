clear, close all;
clc
contactless_center_path='..\contactless_center_data\';

for num1=1:160
    for num2=1:6
        img=imread([contactless_center_path,'contactless_scale\',num2str(num1),'_',num2str(num2),'.bmp']);
        img1=imread([contactless_center_path,'contactless_scale_en\',num2str(num1),'_',num2str(num2),'.bmp']);
blkszeX = 8; thresh = 0.06; margin=0;
[normim, mask] = ridgesegment(img, blkszeX, thresh, margin);
mask1=1-mask;
img22=uint8(double(mask1).*double(img1));
img2=uint8(double(mask).*double(img1));
img2 = adapthisteq(img2,'NumTiles',[3 7],'clipLimit',0.01,'NBins',256,'Distribution','uniform');
img3=img2+img22;

        imwrite(img3,[contactless_center_path,'contactless_scale_en_en\', num2str(num1),'_',num2str(num2),'.bmp']);

    end
end

