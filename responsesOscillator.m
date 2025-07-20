close all
clc
clearvars

model = 'oscillator.mdl';


%% Valores máximos PdI
kp1=6.2;ki1=4.5;h1=1;
kp2=86;ki2=60;h2=1;
kp3=245;ki3=160;h3=1;

figure('Name', 'Respuestas');
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gca,'GridLineStyle','--')
hold on;
grid on;
box on;
ax.GridLineStyle = '--';
subplot(212)
yline(0,'k--','LineWidth',1,'HandleVisibility','off')
hold on
xline(0,'k--','LineWidth',1,'HandleVisibility','off')
box on

kp=kp1;ki=ki1;h=h1;
qp = tds_create_qp([1 0 kp+1 0; 0 0 0 ki],[0; h]);
r1 = tds_roots(qp,-1);

kp=kp2;ki=ki2;h=h2;
qp = tds_create_qp([1 0 kp+1 0; 0 0 0 ki],[0; h]);
r2 = tds_roots(qp,-1);

kp=kp3;ki=ki3;h=h3;
qp = tds_create_qp([1 0 kp+1 0; 0 0 0 ki],[0; h]);
r3 = tds_roots(qp,-1);

Color=[0 0 1;...
       1 0 0;...
       0 0.5 0;...
       0.5 0 0.5;...
       0.5 0.5 0];
hold on
plot(real(r1),imag(r1),'x','MarkerSize',8,'LineWidth',1.5,'Color',Color(2,:))
plot(real(r2),imag(r2),'x','MarkerSize',8,'LineWidth',1.5,'Color',Color(3,:))
plot(real(r3),imag(r3),'x','MarkerSize',8,'LineWidth',1.5,'Color',Color(4,:))
legend('P$\delta$I$_1$','P$\delta$I$_2$','P$\delta$I$_3$','P$\delta$I$_4$','Interpreter','Latex','FontSize',14,'Location','best')
xlabel('$\Re$','Interpreter','Latex','FontSize',16)
ylabel('$\Im$','Interpreter','Latex','FontSize',16)
xlim([-1 0.1])

%% Vectores ganancias
kpp=[kp1 kp2 kp3];
kii=[ki1 ki2 ki3];
hh=[h1 h2 h3];

xx = 0:1e-5:15;
t = zeros(length(xx),length(hh));
u = zeros(length(xx),length(hh));
y = zeros(length(xx),length(hh));
subplot(211)
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gca,'GridLineStyle','--')
hold on;
grid on;
box on;
ax.GridLineStyle = '--';
for j=1:length(hh)
    h=hh(j);
    kp=kpp(j);
    ki=kii(j);
    [t(:,j),u(:,j),y(:,j)]=PI_delayed_sim_NoGraficas(model);  
    if j==1
        yline(1,'k--','LineWidth',1.5,'HandleVisibility','off')
    end
    plot(t(:,j),y(:,j),'LineWidth',1.5,'Color',Color(j+1,:))
end
legend('P$\delta$I$_1$','P$\delta$I$_2$','P$\delta$I$_3$','P$\delta$I$_4$','Interpreter','Latex','FontSize',14,'Location','best')
xlabel('Time \, $(sec.)$','Interpreter','Latex','FontSize',14)
ylabel('$y(t)$','Interpreter','Latex','FontSize',14)
xlim([0 15])