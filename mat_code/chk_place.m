%关于签到地点的信息统计
load chk.mat;
%将数据排序 便于统计
text=sort(cat_name);    

%一下循环得到地点类别对应数据place和对应的签到次数count
prev=text{1};
place{1}=text{1};
count=zeros(1,438);
j=1;
for i=1:length(cat_name)
    if strcmp(text{i},prev)
        count(j)=count(j)+1;
    else
        j=j+1;
        place{j}=text{i};
        prev=text{i};
        count(j)=1;
    end
end

save category_name place count;

%签到地点类别条形图
figure;
bar(count);
title('地点类别与签到次数','FontSize',12);
xlabel('类别','FontSize',12);
ylabel('签到次数','FontSize',12);

saveas(gcf,'chk_place1','jpeg');

%签到地点类别直方图
figure;
hist(count,40);
title('地点类别与签到次数','FontSize',12);
xlabel('次数','FontSize',12);
ylabel('类别','FontSize',12);

axes('position',[0.4,0.4,0.4,0.4]);
hist(count,40);
axis([500 3500 0 4]);
grid on;

saveas(gcf,'chk_place2','jpeg');

%签到地点扇形图

Max=count>1000;          %统计数组中超过1000的元素
N=sum(Max);
M=Max.*count;
M(M==0)=[];              %删除数组中的0元素
otr=sum(count)-sum(M);

index=find(Max~=0); %找到非0元素的位置
figure;
explode=[ones(1,length(M)),0];
pie([M,otr],explode);
lgd=legend(place(index(1:length(M))),'Others');
set(lgd,'Location','NorthEastOutside','Fontsize',14);
tlt=title('签到地点','Fontsize',14,'position',[1,-1.2]);

saveas(gcf,'chk_place3','jpeg');




        