clear, close all;
clc
contactless_center_path='..\contactless_center_data\';

for num1=1:160
    for num2=1:6
      
        img=imread([contactless_center_path,'min_img\',num2str(num1),'_',num2str(num2),'.bmp']);
        core=load([contactless_center_path,'core\ccore',num2str(num1),'_',num2str(num2),'.txt']);
        minutiae=load([contactless_center_path,'min_img\c',num2str(num1),'_',num2str(num2),'.txt']);
        
        blksze = 4; thresh = 0.4; margin=10;
        [normim, mask] = ridgesegment(img, blksze, thresh, margin);
        [normim1, mask1] = ridgesegment(img, 8, 0.2, margin);

        [w,h] = size(mask1);[X,Y]=find(mask1==1);pos=[X,Y];
        [X1,Y1]=find(mask'==1);Y1=sort(Y1);
        centerX=floor((min(X)+max(X))/2);
        centerY=floor((min(Y)+max(Y))/2);
        if centerX<165
            centerX=165;
        end
         if centerY<165
            centerY=165;
        end
          if centerX+164>467
            centerX=467-164;
        end
         if centerY+164>351
            centerY=351-164;
         end
        img1=imcrop(img,[centerY-164,centerX-164,327,327]);
        imwrite(uint8(img1),[contactless_center_path,'contactless\', num2str(num1),'_',num2str(num2),'.bmp']);
         if core(1)~=0
              corenew(1)=core(2)-(centerY-164);corenew(2)=core(3)-(centerX-164);
              save([contactless_center_path,'core_new\',num2str(num1),'_',num2str(num2),'.mat'],'corenew');
         end
           if size(minutiae,1)>2
              minutiae(:,1)=minutiae(:,1)-(centerY-164);
              minutiae(:,2)=minutiae(:,2)-(centerX-164);
              save([contactless_center_path,'min_new\',num2str(num1),'_',num2str(num2),'.mat'],'minutiae');
           end
    end
end
