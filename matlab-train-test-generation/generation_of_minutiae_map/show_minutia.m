function show_minutia(im, ridgeEnd, ridgeBifurcation)
imshow(im);
hold on;
[size_end,size_end1]=size(ridgeEnd);
[size_bir,size_bir1]=size(ridgeBifurcation);

if ~isempty(ridgeEnd)
    for i=1:size_end
	p=plot(ridgeEnd(i,2),ridgeEnd(i,1),'o',...
        'MarkerSize',4,...
        'LineWidth',1);set(p,'MarkerFaceColor',[ridgeEnd(i,4) 0 0]);set(p,'color',[ridgeEnd(i,4) 0 0]);
      lineLength = 8;
   hold on   
   [u,v] = pol2cart(ridgeEnd(i,3),lineLength);  
   quiver(ridgeEnd(i,2),ridgeEnd(i,1),u,v,0,'.','linewidth',2, 'color',[ridgeEnd(i,4) 0 0]);
    end
end;

if ~isempty(ridgeBifurcation)
	hold on
% 	plot(ridgeBifurcation(:,2),ridgeBifurcation(:,1),'xy',...
%         'MarkerSize',5);
 for i=1:size_bir
p=plot(ridgeBifurcation(i,2),ridgeBifurcation(i,1),'o',...
        'MarkerSize',4,...
        'LineWidth',1);set(p,'MarkerFaceColor',[0 0 ridgeBifurcation(i,4)]);set(p,'color',[0 0 ridgeBifurcation(i,4)]);
      lineLength = 8;
   hold on   
   [u,v] = pol2cart(ridgeBifurcation(i,3),lineLength);  
   quiver(ridgeBifurcation(i,2),ridgeBifurcation(i,1),u,v,0,'.','linewidth',2, 'color',[0 0 ridgeBifurcation(i,4)]);
 end
end;

axis equal, axis ij,  hold off
