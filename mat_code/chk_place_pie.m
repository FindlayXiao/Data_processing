
%关于签到地点的信息统计
load chk.mat;
load category_name.mat;

SignPlace={'Shop','Store','Market','Station','Airport','Park','Hotel','Restaurant'};


for i=1:length(SignPlace)
    x=0;
    for j=1:length(place)
        if contains(place{j},SignPlace{i})
            x=x+count(j);
            M(i)=x;
        end
    end
end
         
otr=sum(count)-sum(M);

figure;
explode=[zeros(1,length(SignPlace)),0];
pie([M,otr],explode);
lgd=legend(SignPlace,'Others');
set(lgd,'Location','NorthEastOutside','Fontsize',14);
tlt=title('热门签到地点','Fontsize',14,'position',[1,-1.2]);






        