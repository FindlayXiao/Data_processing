%签到经纬度

%plot总图
load category_name.mat;
load chk.mat;

%分地点类别


SignPlace={'Shop','Market','Store'};
c=colormap(flipud(cool(length(SignPlace))));

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
    plot(x,y,'.r','color',c(k,:));
    
    hold on;
end    
   axis([113.8,114.4,22.2,22.55])
   ylabel('纬度','FontSize',12)
   xlabel('经度','FontSize',12)
   title('Shopping','FontSize',16);
   
   axes('position',[0.2,0.6,0.3,0.3]);
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
    plot(x,y,'.r','color',c(k,:));
    hold on;
end    
   axis([114.12 114.23 22.27 22.33]);
   grid on;