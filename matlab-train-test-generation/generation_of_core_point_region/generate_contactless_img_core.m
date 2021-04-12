clear, close all;
clc
contactless_center_path='..\contactless_center_data\';

csize1=60;csize2=60;
for num1=1:160
    for num2=1:6
        img=imread([contactless_center_path,'contactless_scale_en_en\',num2str(num1),'_',num2str(num2),'.bmp']);
        load([contactless_center_path,'core_new_scale_all\',num2str(num1),'_',num2str(num2),'.mat']);
        centerX=core(1);
        centerY=core(2); 
         minutiae=[centerX,centerY];
        centerX=minutiae(1);
        centerY=minutiae(2);
        centerXnew=centerX;
        centerYnew=centerY;
        if centerX<csize1+1
            centerXnew=csize1+1;
        end
         if centerY<csize2+1
            centerYnew=csize2+1;
        end
          if centerX+csize1>164
            centerXnew=164-csize1;
        end
         if centerY+csize2>164
            centerYnew=164-csize2;
        end
       img2=imcrop(img,[centerXnew-csize1,centerYnew-csize2,2*csize1-1,2*csize2-1]);
        imwrite(uint8(img2),[contactless_center_path,'contactless_center_img\', num2str(num1),'_',num2str(num2),'.bmp']);
    
    end
end
