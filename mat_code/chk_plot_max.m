%基于签到经纬度的地点图

%plot总图
load category_name.mat;
load chk.mat;

figure;
scatter(lng,lat,'.');  %画出签到地点分布总图
xlabel('经度','FontSize',14)
ylabel('纬度','FontSize',14)
title('签到数据经纬度','FontSize',16)
grid on

%分地点类别
Max=count>3000;
N=sum(Max);
MAX=Max.*count;
MAX(MAX==0)=[];              %删除数组中的0元素
otr=sum(count)-sum(Max);

index=find(Max~=0);          %选出数组中的非0元素
Max_place=place(index(1:N));
Sum={MAX,Max_place};

c=colormap(jet(N));          %加入色彩
for k=1:N
    j=1;
    x=zeros(1,max(count));   
    y=zeros(1,max(count));
    for i=1:M-1
        if strcmp(cat_name{i},Max_place{k}) 
            x(j)=lng(i);
            y(j)=lat(i);
            j=j+1;
        end
    end
    x=x(x~=0);
    y=y(y~=0);
    figure;
    plot(x,y,'o','color',c(k,:));
    title(Max_place{k},'FontSize',14);
    axis([113.8 114.4 22.15 22.55]);
    xlabel('经度','FontSize',14)
    ylabel('纬度','FontSize',14)
    
    figure;
    plot(x,y,'o','color',c(k,:));        %利用矩阵取颜色
    title(Max_place{k},'FontSize',14);
    axis([114.15 114.2 22.27 22.32]);
    grid on;
    xlabel('经度','FontSize',14)
    ylabel('纬度','FontSize',14)
end    

