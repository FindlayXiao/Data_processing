%旅行者个人信息
%载入数据
load msg.mat

%二维数据饼状图
A=[sum(gend),N-sum(gend)];
figure;
subplot(2,2,1);
pie(A);
title('性别');
legend('Male','Female','Location','NorthEastOutside');

chk_gend_m=gend.*chk_ct;
chk_gend_f=chk_ct-chk_gend_m;
B=[sum(chk_gend_m)/sum(gend),sum(chk_gend_f)/(N-sum(gend))];
subplot(2,2,2);
pie(B);
title('性别-签到次数');
legend('Male','Female','Location','NorthEastOutside');

frd_gend_m=gend.*friend;
frd_gend_f=friend-frd_gend_m;
C=[sum(frd_gend_m)/sum(gend),sum(frd_gend_f)/(N-sum(gend))];
subplot(2,2,3);
pie(C);
title('性别-朋友数');
legend('Male','Female','Location','NorthEastOutside');

pho_gend_m=gend.*photo;
pho_gend_f=photo-pho_gend_m;
D=[sum(pho_gend_m)/sum(gend),sum(pho_gend_f)/(N-sum(gend))];
subplot(2,2,4);
pie(D);
title('性别-照片数');
legend('Male','Female','Location','NorthEastOutside');

saveas(gcf,'msg_pie','jpeg');


