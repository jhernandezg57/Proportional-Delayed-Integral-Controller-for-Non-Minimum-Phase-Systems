clc
clear
close

set(groot,'defaultAxesTickLabelInterpreter','latex');
h=1;
l=1:1:7;
w=(pi./(2*h)).*(2*l-1);
kp=linspace(-1000,1000,2); 
ki=zeros(length(l),length(kp));

for i=1:length(l)
    for j = 1:length(kp)
        ki(i,j)=((-1)^(l(i)))*(w(i)^3-w(i)-kp(j)*w(i));
    end
end
figure;
for i = 1:length(l)
    plot(kp,ki(i,:),'k','LineWidth',1);
    hold on;
end
kpr=linspace(0,300,1e1);
kir=zeros(1,length(kpr));
hold on
plot(kpr,kir,'b','LineWidth',1)
axis([0 kpr(end) -100 800])