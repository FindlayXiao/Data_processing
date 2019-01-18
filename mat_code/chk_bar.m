%旅行者签到信息
load chk.mat time Time M;


%时间与签到次数
t=time-2012;
T=[2013,2014,2015,2016,2017];
for i=1:5
    all(i)=sum(sum(t-i==0));   %求每一年的签到数据
end
figure;
bar(T,all,'FaceColor',[0.5 0.8 0.8]);
title('Time\_chk','FontSize',12);
xlabel('年份','FontSize',12);
ylabel('签到次数','FontSize',12);
for i=1:5
    textstr=sprintf('  %d\n%.2f%%',all(i),all(i)/sum(all)*100);
    text(T(i)-0.2,all(i)+500,textstr,'FontSize',12);
end

saveas(gcf,'chk_bar','jpeg');


%不同年份不同季度统计
Time_ym=Time(:,1)*100+Time(:,2);
for j=1:4
    tp=(j+2012)*100;
    for k=1:4
        Sum_ym(j,k)=sum(Time_ym==tp+mod(3*k-1,12))+sum(Time_ym==tp+mod(3*k,12))+sum(Time_ym==tp+mod(3*k+1,12));
        if k==4
            Sum_ym(j,k)=Sum_ym(j,k)+sum(Time_ym==tp+12);
        end
    end
end
Year=[2013 2014 2015 2016];
figure;
bar(Year, Sum_ym,'stacked');
colormap(summer);
title('四季度签到次数统计','FontSize',16);
st=legend('Spring','Summer','Autumn','Winter','Location','NorthWest');
set(st,'FontSize',14);
xlabel('年份','FontSize',14);
ylabel('签到次数','FontSize',14);

for i=1:4
    textstr=sprintf('%d',sum(Sum_ym(i,:)));
    text(Year(i)-0.15,sum(Sum_ym(i,:))+300,textstr,'FontSize',12);
end

saveas(gcf,'chk_bar2','jpeg');

%对不同年份的数据进行分月统计

figure;
for j=1:4
    Year=2012+j;
    i=1;
    Time_1=Time;
    while i<=all(j)
        if Time_1(i,1)~=Year
            Time_1(i,:)=[];
            i=i-1;
        end
        i=i+1;
    end
    
    clct=tabulate(Time_1(:,2));
    subplot(2,2,j);
    plot(clct(:,1),clct(:,2),'-rdiamond');
    axis([1,12,200,1800]);
    title(Year,'Fontsize',14);
    xlabel('月份','FontSize',12);
    ylabel('签到次数','FontSize',12);

end

saveas(gcf,'chk_year','jpeg');







