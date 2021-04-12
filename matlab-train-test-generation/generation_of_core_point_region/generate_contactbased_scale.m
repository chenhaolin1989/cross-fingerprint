clear, close all;
clc
contactbased_center_path='..\contactbased_center_data\';

for num1=1:160
    for num2=1:6
        if exist([contactbased_center_path,'core_new\',num2str(num1),'_',num2str(num2),'.mat'],'file')
        core=load([contactbased_center_path,'core_new\',num2str(num1),'_',num2str(num2),'.mat']);
        core=core.corenew;
        core=floor(core/2);
        save([contactbased_center_path,'core_new_scale\',num2str(num1),'_',num2str(num2),'.mat'],'core');
        end
        if exist([contactbased_center_path,'min_new\',num2str(num1),'_',num2str(num2),'.mat'],'file')
        min=load([contactbased_center_path,'min_new\',num2str(num1),'_',num2str(num2),'.mat']);
        min=min.minutiae;
        min(:,1:2)=floor(min(:,1:2)/2);
        save([contactbased_center_path,'min_new_scale\',num2str(num1),'_',num2str(num2),'.mat'],'min');
        end
        img1=imread([contactbased_center_path,'contactbased\',num2str(num1),'_',num2str(num2),'.bmp']);
        img11=imresize(img1,0.5);
        imwrite(uint8(img11),[contactbased_center_path,'contactbased_scale\', num2str(num1),'_',num2str(num2),'.bmp']);
    end
end

