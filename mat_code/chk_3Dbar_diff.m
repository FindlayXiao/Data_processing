load category_name.mat;
load chk.mat;

%分地点类别
times=3000;
Max=count>times;
N=sum(Max);
MAX=Max.*count;
MAX(MAX==0)=[];              %删除数组中的0元素
otr=sum(count)-sum(Max);

index=find(Max~=0);          %选出数组中的非0元素
Max_place=place(index(1:N));
Sum={MAX,Max_place};

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
    
   dvd=100;
   lng_1=floor(x*dvd)/dvd;
   lat_1=floor(y*dvd)/dvd;
   
   cdnt=lng_1*dvd-11384+(lat_1*dvd-2218)/dvd;
   data=tabulate(cdnt);
   
   cd=zeros(53,33);
   for i=1:length(data)
       x=floor(data(i,1));
       y=fix((data(i,1)-floor(data(i,1)))*100)+1;
       cd(x,y)=data(i,2);
   end
   figure;
   bar3(cd);
   title(Max_place{k},'FontSize',12);
   
   xlabel('经度')
   ylabel('纬度')
   zlabel('签到次数')
   ylim([0 53]);
   set(gca, 'XTickLabel', {22.28,22.38,22.48})
   set(gca, 'YTickLabel', {113.84,113.94,114.04,114.14,114.24,114.34})
   colormap(cool);
   
   figure;
   cd1=rot90(cd);
   imagesc(cd1);          %填色函数
   colormap(flipud(hot));
   title(Max_place{k},'FontSize',12);
   
end


