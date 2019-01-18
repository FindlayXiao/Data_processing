%基于签到经纬度的地点图

%plot总图
load category_name.mat;
load chk.mat;

SignPlace={'Shopping Malls','Metro Stations'};

c=colormap(jet(length(SignPlace)));
for k=1:length(SignPlace)
    j=1;
    x=zeros(1,max(count));   
    y=zeros(1,max(count));
    for i=1:M-1
        if contains(cat_name{i},SignPlace{k}) 
            x(j)=lng(i);
            y(j)=lat(i);
            j=j+1;
        end
    end
    x=x(x~=0);
    y=y(y~=0);
    
    figure;
    plot(x,y,'o','color',c(k,:));
    title(SignPlace{k},'FontSize',14);
    axis([113.8 114.4 22.15 22.55]);
    
    figure;
    plot(x,y,'o','color',c(k,:));        %利用矩阵取颜色
    title(SignPlace{k},'FontSize',14);
    axis([114.15 114.2 22.27 22.32]);
    grid on;
end    

