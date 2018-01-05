% Measurements Lab 4 Calculations

%%  1. Calibration curve for the Bourdon gage using recorded vs. actual pressure from deadweight tester.
clear all, close all, clc

A = [10 20 30 40 50 60 70 80];
U = [11 20.5 30.5 40.5 51 60 69.5 80];
D = [10.5 20.5 30 40 50 60 70 80];

figure;
plot(A,U,'ro-',A,D,'bo-'); grid on;
xlabel('Actual Pressure','FontSize',14);ylabel('Bourdon Gauge Reading Pressure','FontSize',14);
h2_legend = legend('Pressure Reading UP','Pressure Reading DOWN','location','se');
set(h2_legend,'FontSize',14);

%title('Calibration curve for the Bourdon gage using recorded vs. actual pressure from deadweight tester');

%%  2. Calibration curve for the pressure transducer versus actual pressure using Bourdon gage and deadweight tester calibrations. 
clear all, close all, clc

I = dlmread('initial.txt', '', 1, 0);    % Initial
I(1:50,:) = []; 
I(:,1) = I(:,1)-5; 
I(1005:end,:) = [];
I(:,2) = I(:,2)+14.7;
a = 90:-5:30
p = [90.3702 85.7803 80.7022 75.3311 70.0577 65.0772 60.2921 54.5303 49.8428 44.4717...
    39.6866 34.4132 30.1163]

figure;
plot(a,p,'bo-'); grid on;
xlabel('Actual Pressure using Calibrated Bourdon gage','FontSize',14);ylabel('Pressure Transducer Reading','FontSize',14);




%% Initial
figure;
[hAx,hLine1,hLine2] = plotyy(I(:,1),I(:,2),I(:,1),I(:,3)); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel(hAx(1),'Pressure (psig)','FontSize',14);
ylabel(hAx(2),'Temperature (C)','FontSize',14);
set(gca,'ytick',[0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100])
legend('Pressure','Temperature','location','ne');


%%  3. Tank Blowdown
clear all, close all, clc

% Matrices in form: Time(sec)   Pressure(psi)   Temperature(C)
V = 5*0.00378541 % m^3
R = 287
din = [0.031 0.062 0.128 0.24]
d = din*0.3048/12
a = d.*d*pi/4
c1 = zeros(1,4);
c2 = zeros(1,4);
tau1 = zeros(1,4);
tau2 = zeros(1,4);
tau3 = zeros(1,4);

A = dlmread('031.txt', '', 1, 0);        % 0.031
A(1:20,:) = []; 
A(:,1) = A(:,1)-20; 
A(300:end,:) = [];
A(:,2) = A(:,2)+14.7;

B = dlmread('062.txt', '', 1, 0);        % 0.062
B(1:1,:) = [];
B(:,1) = B(:,1)-1; 
B(71:end,:) = [];
B(:,2) = B(:,2)+14.7;

C = dlmread('128.txt', '', 1, 0);        % 0.128
C(1:9,:) = [];
C(:,1) = C(:,1)-.9; 
C(165:end,:) = [];
C(:,2) = C(:,2)+14.7;

D = dlmread('240.txt', '', 1, 0);        % 0.240
D(1:187,:) = [];
D(:,1) = D(:,1)-1.87; 
D(700:end,:) = [];
D(:,2) = D(:,2)+14.7;

p = polyfit(A(:,1),log(A(:,2)/A(1,2)),1);
tau1(1) = -1/p(1);
p = polyfit(A(:,1),(A(:,2)/A(1,2)).^(-1/7),1);
tau2(1) = 0.2/p(1);

p = polyfit(B(:,1),log(B(:,2)/B(1,2)),1);
tau1(2) = -1/p(1);
p = polyfit(B(:,1),(B(:,2)/B(1,2)).^(-1/7),1);
tau2(2) = 0.2/p(1);

p = polyfit(C(:,1),log(C(:,2)/C(1,2)),1);
tau1(3) = -1/p(1);
p = polyfit(C(:,1),(C(:,2)/C(1,2)).^(-1/7),1);
tau2(3) = 0.2/p(1);

p = polyfit(D(:,1),log(D(:,2)/D(1,2)),1);
tau1(4) = -1/p(1)
p = polyfit(D(:,1),(D(:,2)/D(1,2)).^(-1/7),1);
tau2(4) = 0.2/p(1)

% A
figure;
[hAx,hLine1,hLine2] = plotyy(A(:,1),A(:,2),A(:,1),A(:,3)); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel(hAx(1),'Pressure (psia)','FontSize',14);
ylabel(hAx(2),'Temperature (C)','FontSize',14);
set(gca, 'YTick', [0 10 20 30 40 50 60 70 80 90 100])
ylim(hAx(2),[0 35]);
legend('Pressure','Temperature','location','ne');

figure;
semilogy(A(:,1), A(:,2)/A(1,2),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('ln(P/P0)','FontSize',14);

figure;
plot(A(:,1), (A(:,2)/A(1,2)).^(-1/7),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('(P/P0)^-1/7','FontSize',14);

% B
figure;
[hAx,hLine1,hLine2] = plotyy(B(:,1),B(:,2),B(:,1),B(:,3)); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel(hAx(1),'Pressure (psia)','FontSize',14);
ylabel(hAx(2),'Temperature (C)','FontSize',14);
legend('Pressure','Temperature','location','ne');

figure;
semilogy(B(:,1), B(:,2)/B(1,2),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('ln(P/P0)','FontSize',14);

figure;
plot(B(:,1), (B(:,2)/B(1,2)).^(-1/7),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('(P/P0)^-1/7','FontSize',14);

% C
figure;
[hAx,hLine1,hLine2] = plotyy(C(:,1),C(:,2),C(:,1),C(:,3)); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel(hAx(1),'Pressure (psia)','FontSize',14);
ylabel(hAx(2),'Temperature (C)','FontSize',14);
legend('Pressure','Temperature','location','ne');

figure;
semilogy(C(:,1), C(:,2)/C(1,2),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('ln(P/P0)','FontSize',14);

figure;
plot(C(:,1), (C(:,2)/C(1,2)).^(-1/7),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('(P/P0)^-1/7','FontSize',14);

% D
figure;
[hAx,hLine1,hLine2] = plotyy(D(:,1),D(:,2),D(:,1),D(:,3)); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel(hAx(1),'Pressure (psia)','FontSize',14);
ylabel(hAx(2),'Temperature (C)','FontSize',14);
legend('Pressure','Temperature','location','ne');

figure;
semilogy(D(:,1), D(:,2)/D(1,2),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('ln(P/P0)','FontSize',14);

figure;
plot(D(:,1), (D(:,2)/D(1,2)).^(-1/7),'r-'); grid on;
xlabel('Time (sec)','FontSize',14);
ylabel('(P/P0)^-1/7','FontSize',14);




figure;
hold on
grid on;
plot(A(:,1)/tau1(1),A(:,2)/A(1,2),'b');
plot(B(:,1)/tau1(2),B(:,2)/B(1,2),'g');
plot(C(:,1)/tau1(3),C(:,2)/C(1,2),'r');
plot(D(:,1)/tau1(4),D(:,2)/D(1,2),'y');
xlabel('Time/Tau','FontSize',14);
ylabel('P/P0','FontSize',14);
h2_legend = legend('D = 0.031"','D = 0.062"','D = 0.128"','D = 0.240"','location','ne');
set(h2_legend,'FontSize',14);


c1(1) = V/(0.0402*R*((A(1,3)+273.15).^0.5)*a(1)*tau1(1));
c1(2) = V/(0.0402*R*((B(1,3)+273.15).^0.5)*a(2)*tau1(2));
c1(3) = V/(0.0402*R*((C(1,3)+273.15).^0.5)*a(3)*tau1(3));
c1(4) = V/(0.0402*R*((D(1,3)+273.15).^0.5)*a(4)*tau1(4))

c2(1) = V/(0.0402*R*((A(1,3)+273.15).^0.5)*a(1)*tau2(1));
c2(2) = V/(0.0402*R*((B(1,3)+273.15).^0.5)*a(2)*tau2(2));
c2(3) = V/(0.0402*R*((C(1,3)+273.15).^0.5)*a(3)*tau2(3));
c2(4) = V/(0.0402*R*((D(1,3)+273.15).^0.5)*a(4)*tau2(4))

figure;
plot(din,c1,'r+-',din,c2,'b+-','MarkerSize',20); grid on;
xlabel('Oriface Diameter (in)','FontSize',14);
ylabel('Discharge Coefficient','FontSize',14);
h1_legend = legend('Isothermal','Adiabatic','location','ne');
set(h1_legend,'FontSize',14);

figure;
hold on
grid on;
plot(A(:,1)/tau1(1),(A(:,3)+273.5)/(A(1,3)+273.15),'r-');
plot(B(:,1)/tau1(2),(B(:,3)+273.5)/(B(1,3)+273.15),'b-');
plot(C(:,1)/tau1(3),(C(:,3)+273.5)/(C(1,3)+273.15),'g-');
plot(D(:,1)/tau1(4),(D(:,3)+273.5)/(D(1,3)+273.15),'c-');
x1 = 0:0.001:1.6;
x2 = 0:0.001:1.6;
ya = (1+(x2*0.2)).^(-2);
plot(x2,ya,'k-');
plot(x1,1,'m-');
xlabel('Time/Tau','FontSize',14);
ylabel('T/T0','FontSize',14);
h_legend = legend('D = 0.031"','D = 0.062"','D = 0.128"','D = 0.240"','Adiabatic','Isothermal','location','sw');
set(h_legend,'FontSize',14);


%%  4. Differential Pressure Transducer
clear all, close all, clc

V = [1.13 1.44 2.03 2.27]
H = ([0.816 0.863 0.937 0.962]-0.8)*0.3048/12
S = [15 30 45 50]*0.3048
P1 = ((V-1.05)/4)*998*9.81*0.3048/12
P2 = H*998*9.81*2
Vel1 = (2*P1/1.19).^0.5
Vel2 = (2*P2/1.19).^0.5

