%绘制原始签到数据的3维柱形图与热度图
load category_name.mat;
load chk.mat;

lng_1=floor(lng*100)/100;
lat_1=floor(lat*100)/100;

cdnt=lng_1*100-11384+(lat_1*100-2218)/100;
data=tabulate(cdnt);

cd=zeros(53,33);
for i=1:length(data)
    x=floor(data(i,1));
    y=fix((data(i,1)-floor(data(i,1)))*100)+1;
    cd(x,y)=data(i,2);
end

figure;
bar3(cd);
ylabel('经度','FontSize',14)
xlabel('纬度','FontSize',14)
zlabel('签到次数','FontSize',14)
ylim([0 53]);
set(gca, 'XTickLabel', {22.28,22.38,22.48})
set(gca, 'YTickLabel', {113.84,113.94,114.04,114.14,114.24,114.34})
title('签到数据3维柱形图','FontSize',16)
colormap(cool)
grid off

figure;
cd1=rot90(cd);
imagesc(cd1);          %填色函数
colormap(flipud(hot));
xlabel('经度','FontSize',14)
ylabel('纬度','FontSize',14)
set(gca, 'YTickLabel', {22.5 22.45 22.4 22.35 22.3 22.25 22.2})
set(gca, 'XTickLabel', {113.86 113.92 113.98 114.04 114.1 114.16 114.22 114.28 114.34 114.4})
title('热度图','FontSize',16)





