clear, close all;
clc
contactbased_center_path='..\contactbased_center_data\';


for num1=1:160
    for num2=1:6
        img=imread([contactbased_center_path,'min_img\',num2str(num1),'_',num2str(num2),'.bmp']);
         core=load([contactbased_center_path,'core\score',num2str(num1),'_',num2str(num2),'.txt']);
        minutiae=load([contactbased_center_path,'min_img\s',num2str(num1),'_',num2str(num2),'.txt']);
        [x,y]=find(img~=255);x=sort(x);
        up=x(1)-1;down=356-x(end);
        if up+down<1
            img_new=img(15:342,:);
            if core(1)~=0
              corenew(1)=core(2);
              corenew(2)=core(3)-15;
              save([contactbased_center_path,'core_new\',num2str(num1),'_',num2str(num2),'.mat'],'corenew');
            end
           if size(minutiae,1)>2
              minutiae(:,1)=minutiae(:,1);
              minutiae(:,2)=minutiae(:,2)-15;
              save([contactbased_center_path,'min_new\',num2str(num1),'_',num2str(num2),'.mat'],'minutiae');
           end
        else
            uppixel=floor(28*up/(up+down)); downpixel=28-uppixel;
            img_new=img(uppixel+1:356-downpixel,:);
             if core(1)~=0
              corenew(1)=core(2);
              corenew(2)=core(3)-uppixel;
              save([contactbased_center_path,'core_new\',num2str(num1),'_',num2str(num2),'.mat'],'corenew');
             end
          if size(minutiae,1)>2
              minutiae(:,1)=minutiae(:,1);
              minutiae(:,2)=minutiae(:,2)-uppixel;
              save([contactbased_center_path,'min_new\',num2str(num1),'_',num2str(num2),'.mat'],'minutiae');
           end

        end
        [sizex,sizey]=size(img_new);
        if sizex~=328 || sizey~=328 
            flag=flag+1;
        end
        imwrite(img_new,[contactbased_center_path,'contactbased\', num2str(num1),'_',num2str(num2),'.bmp']);
    end
end

