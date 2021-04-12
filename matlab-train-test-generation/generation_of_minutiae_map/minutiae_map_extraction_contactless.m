clear all;
clc
contactless_min_path='..\contactless_min\';

for i=1:160
 mkdir([contactless_min_path,'\p',num2str(ii)]);

  for j=1:6
%         for k=1:6
            totalridgeEnd=[];
            totalridgeBifurcation=[];
            totalminutiae=[];
    img=imread(['..\contactless_cnn\',num2str(i),'_',num2str(j),'.bmp']);
    [sizex,sizey]=size(img);
    [ridgeEndnew,ridgeBifurcationnew,minutiaenew] = extractminutae_contactless_cnn(img);
    totalridgeEnd=ridgeEndnew;
    totalridgeBifurcation=ridgeBifurcationnew;
      totalridgeEnd(:,6)=1;  
      totalridgeBifurcation(:,6)=2;
      totalminutiae=[totalridgeEnd;totalridgeBifurcation];
     save ([contactless_min_path,'p',num2str(ii),'\minutiae_', num2str(jj),'.mat'], 'totalminutiae');

end
end