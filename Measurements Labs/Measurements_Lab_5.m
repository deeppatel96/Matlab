% Measurements Lab 5 Calculations

%%  1. 
clear all, close all, clc

FR = [20:20:180]
p1s = [1.42 1.4 1.35 1.30 1.25 0.85 1.15 0.91 0.80]
p2s = [0.775 0.710 0.700 0.65 0.52 0.50 0.50 0.42 0.38]
h = [287 280 290 289 289 279 283 281 180;
    289 271 286 285 286 275 272 272 170;
    292 258 286 284 286 250 259 258 158;
    295 240 283 281 285 228 240 238 138;
    297 221 281 278 284 206 222 220 119;
    302 189 280 274 283 168 189 187 84;
    296 142 262 256 268 114 140 138 32;
    344 144 308 296 311 110 136 138 28;
    390 134 342 322 346 88 130 126 12;];

h = h./1000

p1p = [0.75 0.72 0.71 0.70 0.69 0.65 0.62 0.59 0.45]
p2p = [0.75 0.72 0.71 0.70 0.69 0.65 0.62 0.59 0.45]

T =[63.00 87.00 81.00 79.00;
    36.60 52.62 52.48 52.27;
    28.13 37.29 37.91 39.30;
    22.29 30.56 29.90 30.39;
    18.48 25.37 25.10 25.55;
    11.29 21.44 20.82 20.01;
    9.940 18.60 18.59 16.94;
    9.210 15.26 15.73 15.66;
    7.410 13.19 13.96 13.78;];

T = T(:,2:4)
M = (6*60)./T
rho = 1 % kg/L
Q = M./rho
Q_act = zeros(1,size(Q,1));
for i = 1:size(Q,1)
    Q_act(i) = sum(Q(i,:))/size(Q,2);
end
Q_act

p = polyfit(Q_act,FR,1);
x = 0:0.1:30;
y = p(1).*x + p(2);

Qv = (57.73 * ((h(:,1)-h(:,2)).^0.5)).'
Qo = (50.74 * ((h(:,5)-h(:,6)).^0.5)).'


figure;
plot(Q_act,FR,'ro','MarkerEdgeColor','k','MarkerFaceColor',[.49 1 .23],...
    'MarkerSize',8); grid on;
xlabel('Q (liters/min)'); ylabel('mm');
hold on;
plot(x,y,'k');


figure;
plot(Q_act,Q_act,'k-',Q_act,Qv,'bo-',Q_act,Qo,'go-','MarkerFaceColor',[.49 1 .83],...
    'MarkerSize',8); grid on;
xlabel('Actual Flow Rate (L/min)'); ylabel('Measured Flow Rate (L/min)');
legend('Direct Measurement (Actual/Reference)','Venturi Meter','Orifice Meter','location','se')


% Error Analysis

T_avg = (sum(T,2))/size(T,2)
sd = zeros(length(T_avg),1);
for i = 1:length(T_avg)
    for j = 1:size(T,2)
        sd(i) = sd(i) + (T_avg(i)-T(i,j)).^2;
    end
end
sd = sd/size(T,2);
sd = (sd.^0.5)/(size(T,2).^0.5)

% Error
ub = ((360./(T_avg.^2).*0.5).^2 + (4.303.*sd).^2).^0.5
ur = [.1 .1 .1 .1 .1 .1 .1 .1 .1].'
uv = 28.86*0.001./((h(:,1)-h(:,2)).^0.5)
uo = 25.37*0.001./((h(:,5)-h(:,6)).^0.5)


figure;
plot(Q_act,ub,'r-o',Q_act,uv,'b-o',Q_act,uo,'g-o',Q_act,ur,'k-o');
grid on;
xlabel('Flow Rate (L/min)');
ylabel('Measurement Error');
legend('Direct Measurement','Venturi Tube','Orifice Meter','Rotameter')




% Head Loss
dHv = h(:,1)-h(:,3);
khv = 0.167*(h(:,1)-h(:,2));
hlv = dHv./khv

dHo = 0.83*(h(:,5)-h(:,6));
kho = khv/16;
hlo = dHo./kho

hlr = h(:,8)-h(:,9)

hld = (h(:,3)-h(:,4) + (15/16*khv))./khv

ikh = khv/16;
okh = ikh*2.8;
hlb = (h(:,7)-h(:,8) + ikh - okh)./ikh

figure;
plot(Q_act,hlv,'r-o',Q_act,hlo,'b-o',Q_act,hlr,'y-o',Q_act,hld,'k-o',Q_act,hlb,'g-o');
grid on;
xlabel('Flow Rate (L/min)');
ylabel('Head Loss');
legend('Venturi Tube','Orifice Meter','Rotameter','Wide-Angled Diffuser','Right angled Bend')


% Pump efficiency
Q_actm = Q_act/1000/60;

ns1 = Q_actm.*(p1s-p2s)*100000./110*100
ns2 = Q_actm.*(p2s)*100000./110*100

np1 = Q_actm./2.*(p1p)*100000./110*100
np2 = Q_actm./2.*(p2p)*100000./110*100

p = polyfit(Q_actm*10000,ns1,2);
x = 0:0.1:6;
y1 = p(1).*x.*x + p(2).*x + p(3);
p = polyfit(Q_actm*10000,np1,2);
y2 = p(1).*x.*x + p(2).*x + p(3);


figure;
plot(Q_actm*10000,ns1,'ro'); grid on;
xlabel('Flow Rate (m^3/s) *10^4');
ylabel('Pump 1 efficiency (%)');

hold on;
plot(Q_actm*10000,np1,'bo'); grid on;
legend('Series Configuration','Parallel Configuration','location','nw')



plot(x,y1,'r-',x,y2,'b-')





