load category_name.mat;
load chk.mat;

%分地点类别
SignPlace='Airports';
for i=1:438
    if strcmp(SignPlace,place(i))
        Max=count==count(i);
        break
    end
end
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
   lng_3=floor(x*dvd)/dvd;
   lat_3=floor(y*dvd)/dvd;
   
   cdnt=lng_3*dvd-11384+(lat_3*dvd-2218)/dvd;
   data=tabulate(cdnt);
   
   lng_4=fix(data(:,1));
   lat_4=data(:,1)-fix(data(:,1));
   
   figure;
   stem3(lng_4,lat_4,data(:,2));
   title(Max_place{k},'FontSize',14);
   
   
   ylabel('纬度','FontSize',12)
   xlabel('经度','FontSize',12)
   zlabel('签到次数','FontSize',12)
   xlim([0 53]);
   set(gca, 'YTickLabel', {22.15,22.22,22.29,22.36,22.43,22.5})
   set(gca, 'XTickLabel', {113.84,113.94,114.04,114.14,114.24,114.34})
end    

