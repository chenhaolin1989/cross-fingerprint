clear, close all;
clc;

contactbased_img_path='..\contactbased_cnn_enhance_enhance\';


for num1=1:160
    for num2=1:6
      
	img=imread(['..\contactbased_train_cnn_enhance\',num2str(num1),'_',num2str(num2),'.bmp']);
	img2 = adapthisteq(img,'NumTiles',[3 7],'clipLimit',0.01,'NBins',256,'Distribution','uniform');
        imwrite(img2,[contactbased_img_path, num2str(num1),'_',num2str(num2),'.bmp']);
    end
end