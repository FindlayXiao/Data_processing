%旅行者个人信息-基于像素的数据可视化分析
%载入数据
load msg.mat

label={'user-id','gender','checkins-count','photos-count','friends-count'};
All=[user_id2(1:702);gend(1:702);chk_ct(1:702);photo(1:702);friend(1:702)];

%利用五种不同属性为关键字进行绘图排序
for m=1:5
    All2=sortrows(All',m);
    All3=reshape(All2,[26,27,5]);
    figure;
    for i=1:5
        subplot(2,3,i);
        imagesc(All3(:,:,i));    %填色函数
        colormap(1-gray(256));
        if(i==m)
            title(label(i),'Color','r','FontSize',16);
        else
            title(label(i),'FontSize',16);
        end
        axis off
    end
    saveas(gcf,label{m},'jpeg');
end

