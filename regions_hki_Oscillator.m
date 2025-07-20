clc
close all 
clear

set(groot,'defaultAxesTickLabelInterpreter','latex');
%G=1/(s^2+1)

w = linspace(0,1e4,1e6); 
kp=5;
lambda=-1;

P0=1i.*(w+kp.*w-w.^3);
P1=1; % ki e^{-hs}

m=-10:1:10;
for j=1:length(m)
    h0 = (1./w).*(angle(P1)-angle(P0)+((2*(m(j)))+1)*(pi));
    Ki1 =  abs(P0./P1);
    figure(1)
    plot(h0,Ki1,'k.');
    hold on
end

gma=0;
hRect = linspace(0,20,1000);
P00=-((1+kp).*gma)-gma.^3;
P11=1;
KiRect = -exp(-gma.*hRect).*(sqrt(real(P00).^2 + imag(P00).^2)./sqrt(real(P11).^2 + imag(P11).^2));

hold on
plot(hRect,KiRect,'r.');
xlim([0 20])
ylim([0 6])
ylabel('$k_i(\omega,k_p)$','FontSize',16,'interpreter','latex');
xlabel('$h(\omega,k_p)$','FontSize',16, 'interpreter','latex');