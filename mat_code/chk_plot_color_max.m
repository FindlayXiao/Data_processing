%签到经纬度

%plot总图
load category_name.mat;
load chk.mat;

%分地点类别
Max=count>3000;
N=sum(Max);
MAX=Max.*count;
MAX(MAX==0)=[];              %删除数组中的0元素
otr=sum(count)-sum(Max);

index=find(Max~=0);
Max_place=place(index(1:N));
Sum={MAX,Max_place};

c=colormap(jet(N));

for k=1:N
    j=1;
    x=zeros(1,max(count));
    y=zeros(1,max(count));
    for i=1:M-1
        if contains(cat_name{i},Max_place{k}) 
            x(j)=lng(i);
            y(j)=lat(i);
            j=j+1;
        end
    end
    x=x(x~=0);
    y=y(y~=0);
    plot(x,y,'or','color',c(k,:));
    title('max_plot','FontSize',16);
    axis([114.14 114.2 22.27 22.32]);
    hold on;
end    