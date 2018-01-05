
%%
clear all, close all, clc

brass = dlmread('brass.csv');
aluminum = dlmread('aluminum.csv');
copper = dlmread('copper.csv');
brass = brass(1:(end-17),:);
aluminum = aluminum(1:(end-19),:);
copper = copper(1:(end-21),:);
brass = [0 0 0 0; brass];
aluminum = [0 0 0 0; aluminum];
copper = [0 0 0 0; copper];

units = 0.0254;
Bh = 2.471*units;
Bw = 0.2355*units;
Bt = 0.0315*units;
Ah = 2.407*units;
Aw = 0.2369*units;
At = 0.0281*units;
Ch = 2.398*units;
Cw = 0.2424*units;
Ct = 0.0381*units;

Barea = Bw*Bt;
Aarea = Aw*At;
Carea = Cw*Bt;

Bstress = brass(:,3)/Barea;
Astress = aluminum(:,3)/Aarea;
Cstress = copper(:,3)/Aarea;
[x Bi] = max(Bstress);
[x Ai] = max(Astress);
[x Ci] = max(Cstress);

Bstrain = brass(:,2)/Bh;
Astrain = aluminum(:,2)/Ah;
Cstrain = copper(:,2)/Ch;

% Stress Strain Curves
figure;
plot(Bstrain(8), Bstress(8)/1e6,'go', Bstrain(Bi), Bstress(Bi)/1e6,'bo', Bstrain(end), Bstress(end)/1e6,'ro', Bstrain, Bstress/1e6,'k-','MarkerSize',14); grid on;
xlabel('Strain (mm/mm)','FontSize',12); ylabel('Stress (MPa)','FontSize',12);
title('Brass Stress-Strain Curve','FontSize',12)
lgd1 = legend('Proportional Limit', 'Ultimate Stress', 'Fracture Stress', 'location','se');
set(lgd1,'FontSize',14); 

figure;
plot(Astrain(4), Astress(4)/1e6,'go', Astrain(Ai), Astress(Ai)/1e6,'bo', Astrain(end), Astress(end)/1e6,'ro', Astrain, Astress/1e6,'k-','MarkerSize',14); grid on;
xlabel('Strain (mm/mm)','FontSize',12); ylabel('Stress (MPa)','FontSize',12);
title('Aluminum Stress-Strain Curve','FontSize',12)
lgd2 = legend('Proportional Limit', 'Ultimate Stress', 'Fracture Stress', 'location','se');
set(lgd2,'FontSize',14); 
axis([0 0.09 0 220]);

figure;
plot(Cstrain(4), Cstress(4)/1e6,'go', Cstrain(Ci), Cstress(Ci)/1e6,'bo', Cstrain(end), Cstress(end)/1e6,'ro', Cstrain, Cstress/1e6,'k-','MarkerSize',14); grid on;
xlabel('Strain (mm/mm)','FontSize',12); ylabel('Stress (MPa)','FontSize',12);
title('Copper Stress-Strain Curve','FontSize',12)
lgd3 = legend('Proportional Limit', 'Ultimate Stress', 'Fracture Stress', 'location','se');
set(lgd3,'FontSize',14); 
axis([0 0.35 0 160]);

% Linear Portion of Stress Strain Curves
Bco = polyfit(Bstrain(1:2),Bstress(1:2)/1e6,1)
By = polyval(Bco, Bstrain(1:4));
figure;
plot(Bstrain(1:4), By, 'b-', Bstrain(1:4)+0.002, By, 'r-', 0.0042414,190.8142, 'ro',Bstrain(1:10), Bstress(1:10)/1e6,'k-',Bstrain(1:4), By, 'b-','MarkerSize',12); grid on;
xlabel('Strain (mm/mm)','FontSize',12); ylabel('Stress (MPa)','FontSize',12);
title('Linear Portion of Brass Stress-Strain Curve','FontSize',12)
lgd4 = legend('Linear Fit of Elastic Region', '0.2% Conventional Yield Stress Line','Yield Stress', 'location','se');
set(lgd4,'FontSize',12); 
axis([0 0.006 0 220]);

Aco = polyfit([Astrain(1:2);(Astrain(2)+Astrain(3))/2],[Astress(1:2);(Astress(2)+Astress(3))/1.7]/1e6,1)
Ay = polyval(Aco, [Astrain(1:4)]);
figure;
plot([Astrain(1:4)], Ay, 'b-', [Astrain(1:4)]+0.002, Ay, 'r-', 0.003836,130.5763, 'ro',Astrain(1:6), Astress(1:6)/1e6,'k-','MarkerSize',12); grid on;
xlabel('Strain (mm/mm)','FontSize',12); ylabel('Stress (MPa)','FontSize',12);
title('Linear Portion of Aluminum Stress-Strain Curve','FontSize',12)
lgd4 = legend('Linear Fit of Elastic Region', '0.2% Conventional Yield Stress Line','Yield Stress', 'location','se');
set(lgd4,'FontSize',12); 
axis([0 0.006 0 160]);

Cco = polyfit(Cstrain(1:2),Cstress(1:2)/1e6,1)
Cy = polyval(Cco, Cstrain(1:4));
figure;
plot(Cstrain(1:4), Cy, 'b-', Cstrain(1:4)+0.002, Cy, 'r-', 0.0034861,38.8328, 'ro',Cstrain(1:4), Cstress(1:4)/1e6,'k-',Cstrain(1:4), Cy, 'b-','MarkerSize',12); grid on;
xlabel('Strain (mm/mm)','FontSize',12); ylabel('Stress (MPa)','FontSize',12);
title('Linear Portion of Copper Stress-Strain Curve','FontSize',12)
lgd4 = legend('Linear Fit of Elastic Region', '0.2% Conventional Yield Stress Line','Yield Stress', 'location','se');
set(lgd4,'FontSize',12); 
axis([0 0.005 0 50]);

Amodr = 0;
Amodt = 0;
for i = 1:4-1
    Amodr = Amodr + ((Astress(i+1)+Astress(i))/2)*(Astrain(i+1)-Astrain(i));
end
for i = 1:length(Astress)-1
    Amodt = Amodt + ((Astress(i+1)+Astress(i))/2)*(Astrain(i+1)-Astrain(i));
end
Bmodr = 0;
Bmodt = 0;
for i = 1:8-1
    Bmodr = Bmodr + ((Bstress(i+1)+Bstress(i))/2)*(Bstrain(i+1)-Bstrain(i));
end
for i = 1:length(Astress)-1
    Bmodt = Bmodt + ((Bstress(i+1)+Bstress(i))/2)*(Bstrain(i+1)-Bstrain(i));
end
Cmodr = 0;
Cmodt = 0;
for i = 1:4-1
    Cmodr = Cmodr + ((Cstress(i+1)+Cstress(i))/2)*(Cstrain(i+1)-Cstrain(i));
end
for i = 1:length(Astress)-1
    Cmodt = Cmodt + ((Cstress(i+1)+Cstress(i))/2)*(Cstrain(i+1)-Cstrain(i));
end
Amodr
Amodt
Bmodr
Bmodt
Cmodr
Cmodt

%%
clear all, close all, clc

F = [77.8 61.1 50.4 42.2];
D = 0.004;
L = 0.028;
stress = F*L*32/pi/(D^3)
cycles = [48504 101197 401109 909887]; % at 63 Hz

figure;
semilogx(cycles,stress/1e6,'r.-','MarkerSize',24); grid on;
xlabel('N (cycles)','FontSize',12);ylabel('Stress (MPa)','FontSize',12);
title('S-N Curve','FontSize',12)
axis([0 1000000 100 400])
