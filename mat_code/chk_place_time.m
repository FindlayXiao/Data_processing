load chk.mat;
load category_name.mat;

SignPlace={'Restaurant','Shop','Station','Airport','Hotel'};

for k=1:length(SignPlace)
    j=1;
    t=zeros(1,3500);
    for i=1:M-1
        if contains(cat_name{i},SignPlace{k})
            t(j)=time(i);
            j=j+1;
        end
    end
    count_pt=t-2012;
    for i=1:5
        pt_rst(i,k)=sum(sum(count_pt-i==0));
    end
end
 T=[2013,2014,2015,2016,2017];
 
 %绘制四个地点的条形图
 figure
 bar(T,pt_rst,1);
 
title('Chk\_place\_time','FontSize',16);
xlabel('年份','FontSize',14);
ylabel('签到次数','FontSize',14);
l=legend(SignPlace,'Location','NorthEast');
set(l,'FontSize',12)

saveas(gcf,'chk_place_time','jpeg');
 