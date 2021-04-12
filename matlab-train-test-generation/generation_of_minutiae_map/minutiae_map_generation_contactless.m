clear all; clc; 
contactless_map_path='..\contactless_map\';
contactless_map_tem_path='..\contactless_map_tem\';

im=ones(192,192);
for ii=1:160
    mkdir([contactless_map_path,'\p',num2str(ii)]);
 mkdir([contactless_map_tem_path,'\p',num2str(ii)]);
 
    for jj=1:6
        minutiae=load(['..\contactless_min\p',num2str(ii),'\minutiae_', num2str(jj),'.mat']);
        minutiae=minutiae.totalminutiae;
        minutiae=minutiae(find(minutiae(:,4)>0.5),:);
        [sizex,sizey]=size(minutiae);       
        if sizex<3
       minutiae=load(['..\contactless_min\p',num2str(ii),'\minutiae_', num2str(jj),'.mat']);
        minutiae=minutiae.totalminutiae;
        minutiae=minutiae(find(minutiae(:,4)>0.3),:);
        end
        ridgeend=minutiae(find(minutiae(:,6)==1),:);
        ridgebif=minutiae(find(minutiae(:,6)==2),:);
        show_minutia(im,ridgeend,ridgebif);axis([0 192 0 192]);
f=getframe(gcf);
imwrite(f.cdata,[contactless_map_tem_path,num2str(ii),'_', num2str(jj),'.bmp']);
close(gcf);
img=imread([contactless_map_tem_path,num2str(ii),'_', num2str(jj),'.bmp']);
imgg=imcrop(img,[84 32 191 191]);
imgg=rgb2gray(imgg);
imwrite(imgg,[contactless_map_path,num2str(ii),'_', num2str(jj),'.bmp']);
    end
end
