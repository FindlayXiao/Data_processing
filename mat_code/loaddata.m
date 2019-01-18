%导入旅行者的签到数据
chk=importdata('hk_travler_checkin.csv',','); 

%切割数据以获得方便绘图的系列数组
s1=regexp(chk,',','split'); 
M=length(s1);
for i=2:M
    user_id(i-1)=str2num(s1{i}{1});
    if_local(i-1)=str2num(s1{i}{2});
    venue_id{i-1}=s1{i}{3};
    cat_name{i-1}=s1{i}{4};
    cat_id{i-1}=s1{i}{5};
    lat(i-1)=str2num(s1{i}{6});
    lng(i-1)=str2num(s1{i}{7});    
    time(i-1)=str2num(s1{i}{8}(1:4));
    time_month(i-1)=str2num(s1{i}{8}(6:7));
    time_day(i-1)=str2num(s1{i}{8}(12:13));
end
Time=[time;time_month]';

save chk.mat user_id if_local venue_id cat_name cat_id lat lng time M Time

%导入旅行者的个人信息
msg=importdata('hk_traveler_profile.csv',','); 

%引用结构变量得到相关数据
chk_ct=msg.data(:,1)';
photo=msg.data(:,2)';
friend=msg.data(:,3)';

%切割结构中元胞数组元素
pro=msg.textdata;
N=length(pro);
for i=2:N
    user_id2(i-1)=str2num(pro{i,1});
    if_local2(i-1)=str2num(pro{i,2});
    gend(i-1)=strcmp(pro{i,3},'male');   %将性别男和女转化成1与0
end

save msg.mat chk_ct photo friend pro user_id2 if_local2 gend N




