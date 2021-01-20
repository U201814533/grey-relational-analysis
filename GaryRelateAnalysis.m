clc,clear
load x.txt   %把原始数据存放在纯文本文件 x.txt 中
for i=1:15     
    x(i,:)=x(i,:)/x(i,1);   %标准化数据 
end
for i=16:17     
    x(i,:)=x(i,1)./x(i,:);  %标准化数据 
end
data=x; 
n=size(data,2); %求矩阵的列数，即观测时刻的个数 
ck=data(1,:);  %提出参考数列 
bj=data(2:end,:); %提出比较数列 
m2=size(bj,1); %求比较数列的个数 
for j=1:m2       
    t(j,:)=bj(j,:)-ck; 
end
mn=min(min(abs(t')));  %求小差
mx=max(max(abs(t')));  %求大差
rho=0.5;  %分辨系数设置 
ksi=(mn+rho*mx)./(abs(t)+rho*mx);  %求关联系数 
r=sum(ksi')/n  %求关联度 
[rs,rind]=sort(r,'descend')   %对关联度进行排序