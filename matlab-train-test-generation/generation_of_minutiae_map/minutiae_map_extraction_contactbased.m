clear all;
clc

contactbased_min_path='..\contactbased_min\';


for ii=1:160
mkdir([contactbased_min_path,'\p',num2str(ii)]);

    for jj=1:6
            totalridgeEnd=[];
            totalridgeBifurcation=[];
            totalminutiae=[];
    img=imread(['..\contactbased_cnn\',num2str(ii),'_',num2str(jj),'.bmp']);  
    [sizex,sizey]=size(img);
    [ridgeEndnew,ridgeBifurcationnew] = extractminutae_contactbased_cnn(img);
    [sizeLend,sizeWend]=size(ridgeEndnew);
    [sizeLbi,sizeWbi]=size(ridgeBifurcationnew);
       totalridgeEnd=cat(1,totalridgeEnd,ridgeEndnew);
    totalridgeBifurcation=cat(1,totalridgeBifurcation,ridgeBifurcationnew);
      totalridgeEnd(:,5)=1;  
      totalridgeBifurcation(:,5)=2;
      totalminutiae=[totalridgeEnd;totalridgeBifurcation];
     save ([contactbased_min_path,'p',num2str(ii),'\minutiae_', num2str(jj),'.mat'], 'totalminutiae');
     
    end
end