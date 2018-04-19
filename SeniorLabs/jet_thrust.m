% Deep Patel
% Jet Thrust Lab

clear all, close all, clc

% From text file: jet_thrust_0411.txt in this Folder

% Column headings: Index	Thrust [N]	Probe Position [mm]	  Po [kPa]	Pitot Pressure [kPa]
A1 = [
0.000	1.558	0.160	110.815	101.289
1.000	1.560	1.344	110.882	101.298
2.000	1.559	2.515	110.920	101.289
3.000	1.559	3.673	111.004	101.290
4.000	1.588	4.820	111.065	101.285
5.000	1.605	5.978	111.126	101.289
6.000	1.605	7.134	111.200	101.304
7.000	1.605	8.296	111.261	101.368
8.000	1.606	9.467	111.257	101.588
9.000	1.605	10.628	111.208	101.973
10.000	1.605	11.781	111.114	102.644
11.000	1.606	12.932	111.016	103.706
12.000	1.559	14.073	110.911	105.116
13.000	1.559	15.202	110.798	106.681
14.000	1.527	16.352	110.692	107.914
15.000	1.514	17.505	110.683	108.743
16.000	1.514	18.678	110.707	108.922
17.000	1.513	19.842	110.739	108.565
18.000	1.557	21.001	110.780	107.630
19.000	1.559	22.166	110.840	106.323
20.000	1.561	23.300	110.906	104.952
21.000	1.559	24.447	110.968	103.712
22.000	1.571	25.604	111.030	102.781
23.000	1.606	26.759	111.090	102.131
24.000	1.605	27.913	111.157	101.688
25.000	1.605	29.092	111.222	101.440
26.000	1.605	30.263	111.263	101.332
27.000	1.605	31.403	111.212	101.296
28.000	1.605	32.544	111.152	101.294
29.000	1.605	33.681	111.038	101.298
30.000	1.558	34.805	110.919	101.298 ];

A2 = [
0.000	8.813	0.100	164.009	101.280
1.000	8.708	1.284	163.132	101.274
2.000	8.623	2.455	162.538	101.269
3.000	8.611	3.612	162.542	101.272
4.000	8.607	4.761	162.657	101.261
5.000	8.625	5.918	162.896	101.255
6.000	8.653	7.073	163.119	101.283
7.000	8.693	8.238	163.421	101.505
8.000	8.730	9.409	163.783	102.404
9.000	8.766	10.569	164.136	104.648
10.000	8.828	11.725	164.552	109.189
11.000	8.872	12.874	164.857	116.951
12.000	8.921	14.011	165.250	127.813
13.000	8.957	15.156	165.663	139.491
14.000	8.965	16.309	165.728	148.126
15.000	8.962	17.466	165.494	152.441
16.000	8.906	18.634	164.967	152.689
17.000	8.835	19.802	164.287	149.453
18.000	8.760	20.964	163.583	142.751
19.000	8.670	22.128	162.761	133.220
20.000	8.581	23.273	162.174	122.826
21.000	8.565	24.408	162.085	114.160
22.000	8.565	25.562	162.189	108.344
23.000	8.576	26.717	162.362	104.793
24.000	8.610	27.878	162.627	102.667
25.000	8.654	29.059	162.975	101.635
26.000	8.695	30.228	163.235	101.317
27.000	8.741	31.374	163.556	101.262
28.000	8.775	32.515	163.966	101.262
29.000	8.825	33.656	164.377	101.269
30.000	8.875	34.783	164.776	101.282 ];

A3 = [
0.000	14.978	0.076	220.012	101.277
1.000	14.793	1.261	218.550	101.263
2.000	14.631	2.432	217.066	101.241
3.000	14.504	3.590	215.627	101.273
4.000	14.351	4.738	214.811	101.421
5.000	14.351	5.895	214.609	101.934
6.000	14.310	7.052	214.642	102.651
7.000	14.353	8.214	214.989	103.882
8.000	14.395	9.385	215.367	106.419
9.000	14.442	10.554	215.680	110.670
10.000	14.488	11.699	216.346	117.418
11.000	14.572	12.850	216.887	130.491
12.000	14.616	13.988	217.430	148.052
13.000	14.703	15.133	218.096	167.057
14.000	14.775	16.284	218.748	181.821
15.000	14.844	17.438	219.351	192.060
16.000	14.890	18.609	219.735	194.640
17.000	14.889	19.775	219.497	187.971
18.000	14.844	20.943	218.777	174.431
19.000	14.742	22.100	217.753	155.067
20.000	14.612	23.236	216.614	135.500
21.000	14.487	24.375	215.312	121.135
22.000	14.343	25.532	214.087	113.180
23.000	14.273	26.686	213.761	108.503
24.000	14.262	27.849	213.802	105.431
25.000	14.307	29.028	214.014	103.477
26.000	14.309	30.197	214.390	102.144
27.000	14.362	31.346	214.885	101.525
28.000	14.419	32.480	215.390	101.271
29.000	14.485	33.625	215.995	101.241
30.000	14.563	34.751	216.590	101.239 ];

A4 = [
0.000	18.949	0.107	256.951	101.250
1.000	18.693	1.288	254.904	101.261
2.000	18.518	2.462	253.648	101.219
3.000	18.417	3.617	252.847	101.227
4.000	18.374	4.766	252.576	101.212
5.000	18.373	5.923	252.947	101.307
6.000	18.422	7.076	253.468	101.463
7.000	18.486	8.243	253.993	102.475
8.000	18.558	9.407	254.552	104.355
9.000	18.629	10.570	255.236	107.911
10.000	18.698	11.723	255.844	119.457
11.000	18.760	12.872	256.492	142.008
12.000	18.836	14.012	257.357	167.950
13.000	18.938	15.157	258.141	195.111
14.000	19.008	16.308	258.709	214.478
15.000	19.038	17.462	258.773	221.520
16.000	18.984	18.631	258.164	218.513
17.000	18.889	19.803	257.171	209.142
18.000	18.790	20.959	255.883	191.120
19.000	18.612	22.123	254.390	169.988
20.000	18.445	23.260	252.895	145.880
21.000	18.355	24.397	252.246	126.790
22.000	18.323	25.552	252.160	114.686
23.000	18.323	26.700	252.348	107.541
24.000	18.360	27.858	252.696	103.725
25.000	18.410	29.039	253.215	101.971
26.000	18.490	30.203	253.833	101.332
27.000	18.528	31.346	254.480	101.185
28.000	18.617	32.485	255.156	101.201
29.000	18.676	33.630	255.898	101.211
30.000	18.775	34.756	256.665	101.218 ];

A5 = [
0.000	25.081	0.078	315.462	101.241
1.000	24.863	1.261	313.360	101.245
2.000	24.627	2.432	311.336	101.240
3.000	24.448	3.590	310.165	101.232
4.000	24.403	4.742	309.827	101.219
5.000	24.390	5.900	309.894	101.215
6.000	24.419	7.060	310.195	101.331
7.000	24.445	8.223	310.683	102.281
8.000	24.516	9.394	311.300	105.790
9.000	24.587	10.559	311.932	115.735
10.000	24.665	11.712	312.671	136.663
11.000	24.736	12.865	313.483	168.472
12.000	24.808	14.009	314.322	200.733
13.000	24.922	15.149	315.101	231.058
14.000	25.022	16.299	315.980	257.151
15.000	25.105	17.454	316.554	265.390
16.000	25.120	18.626	316.588	267.627
17.000	25.094	19.796	315.870	265.175
18.000	24.954	20.953	314.592	239.420
19.000	24.784	22.118	312.986	201.632
20.000	24.599	23.264	311.127	165.896
21.000	24.378	24.389	309.325	136.320
22.000	24.301	25.541	308.705	117.756
23.000	24.258	26.694	308.534	108.212
24.000	24.263	27.851	308.731	103.620
25.000	24.307	29.032	309.207	101.692
26.000	24.354	30.200	309.756	101.244
27.000	24.446	31.345	310.519	101.204
28.000	24.521	32.481	311.190	101.205
29.000	24.605	33.625	311.986	101.227
30.000	24.703	34.755	312.846	101.225 ];

% V is Valve Position in degrees
% P is Stagnation Pressure in kPa
V1 = 21.243782;
Pt1 = 110.798734;

V2 = 26.660504;
Pt2 = 164.438063;

V3 = 30.624508;
Pt3 = 220.643515;

V4 = 33.385702;
Pt4 = 257.911440;

V5 = 36.748245;
Pt5 = 316.411738;


% Part 1 : Method 2 isentropic
Patm = 101.325;
rhoatm = 1.225;
gamma = 1.4;
R = 297;
T0 = 290;    % Kelvin (total temperature assumed constant)
diameter = 0.411*0.0254;
Aexit = pi*(diameter^2)/4

M1 = ( (2/(gamma-1)) * (( ((Pt1/Patm) ^ ((gamma-1)/gamma))) - 1))^0.5
M2 = ( (2/(gamma-1)) * (( ((Pt2/Patm) ^ ((gamma-1)/gamma))) - 1))^0.5
M3 = ( (2/(gamma-1)) * (( ((Pt3/Patm) ^ ((gamma-1)/gamma))) - 1))^0.5
M4 = ( (2/(gamma-1)) * (( ((Pt4/Patm) ^ ((gamma-1)/gamma))) - 1))^0.5
M5 = ( (2/(gamma-1)) * (( ((Pt5/Patm) ^ ((gamma-1)/gamma))) - 1))^0.5


% Subsonic M<1

Texit1 = T0 / (1 + (((gamma-1)/2) * (M1^2)))
Texit2 = T0 / (1 + (((gamma-1)/2) * (M2^2)))

Vexit1 = M1 * ((gamma * R * Texit1)^0.5)
Vexit2 = M2 * ((gamma * R * Texit2)^0.5)

rhoexit1 = Patm*1000/(R*Texit1)
rhoexit2 = Patm*1000/(R*Texit2)

% Supersonic M>1

Texit = T0/1.2

Vexit = (gamma * R * Texit)^0.5

Pexit3 = Pt3/1.893
Pexit4 = Pt4/1.893
Pexit5 = Pt5/1.893

rhoexit3 = Pexit3*1000 / (R*Texit)
rhoexit4 = Pexit4*1000 / (R*Texit)
rhoexit5 = Pexit5*1000 / (R*Texit)

% Thrust Calculation for incompressible flow comparison
Thrust1 = -(Vexit1^2)*rhoexit1*Aexit
Thrust2 = -(Vexit2^2)*rhoexit2*Aexit
Thrust3 = -(Pexit3-Patm)*Aexit -(Vexit^2)*rhoexit3*Aexit
Thrust4 = -(Pexit4-Patm)*Aexit -(Vexit^2)*rhoexit4*Aexit
Thrust5 = -(Pexit5-Patm)*Aexit -(Vexit^2)*rhoexit5*Aexit

figure;
plot(Pt1,M1,'.',Pt2,M2,'.',Pt3,M3,'.',Pt4,M4,'.',Pt5,M5,'.','MarkerSize',30); grid on;
xlabel('Stagnation Pressure (kPa)', 'FontSize',14);
ylabel('Mach Number', 'FontSize',14);
title('Mach Number vs. Chamber Stagnation Pressure', 'FontSize',14);

% Incompressible Analysis

% rho is not included in the equation because V is squared int he thrust eq
% and rho cancels out
Vin1 = (2*1000*(Pt1-Patm))^0.5
Vin2 = (2*1000*(Pt2-Patm))^0.5
Vin3 = (2*1000*(Pt3-Patm))^0.5
Vin4 = (2*1000*(Pt4-Patm))^0.5
Vin5 = (2*1000*(Pt5-Patm))^0.5

thrustin1 = -(Vin1^2)*Aexit
thrustin2 = -(Vin2^2)*Aexit
thrustin3 = -(Vin3^2)*Aexit
thrustin4 = -(Vin4^2)*Aexit
thrustin5 = -(Vin5^2)*Aexit

thrustcompress = -[Thrust1; Thrust2; Thrust3; Thrust4; Thrust5]
thrustincompress = -[thrustin1; thrustin2; thrustin3; thrustin4; thrustin5]
Pt = [Pt1; Pt2; Pt3; Pt4; Pt5];
figure;
plot(Pt, thrustcompress,'r.-', Pt, thrustincompress,'b.-'); grid on;
xlabel('Stagnation Pressure (kPa)', 'FontSize',14);
ylabel('Thrust (N)', 'FontSize',14);
title('Effect of Compressibility Assumption on Thrust vs. Stagnation Pressure', 'FontSize',14);
lgd = legend('Compressible Assumption','Incompressible Assumption','location','nw');
set(lgd,'FontSize',14);

percentdiff5 = (thrustin5-Thrust5)/Thrust5*100


% Method 3 - isentropic
Mr1 = ( (2/(gamma-1)).* (( ((A1(:,5)./Patm).^ ((gamma-1)/gamma))) - 1)).^0.5;
Mr1 = real(Mr1);
Mr2 = ( (2/(gamma-1)).* (( ((A2(:,5)./Patm).^ ((gamma-1)/gamma))) - 1)).^0.5;
Mr2 = real(Mr2);
Mr3 = ( (2/(gamma-1)).* (( ((A3(:,5)./Patm).^ ((gamma-1)/gamma))) - 1)).^0.5;
Mr3 = real(Mr3);
Mr4 = ( (2/(gamma-1)).* (( ((A4(:,5)./Patm).^ ((gamma-1)/gamma))) - 1)).^0.5;
Mr4 = real(Mr4);
Mr5 = ( (2/(gamma-1)).* (( ((A5(:,5)./Patm).^ ((gamma-1)/gamma))) - 1)).^0.5;
Mr5 = real(Mr5);

figure;
plot(A1(:,3),Mr1,'r-',A2(:,3),Mr2,'b-',A3(:,3),Mr3,'g-',A4(:,3),Mr4,'m-',A5(:,3),Mr5,'k-'); grid on;
xlabel('Probe Position (mm)', 'FontSize',14);
ylabel('Mach Number', 'FontSize',14);
title('Mach Number vs. Probe Position for all Stagnation Pressures', 'FontSize',14);
lgd = legend('Pt = 110.79','Pt = 164.44','Pt = 220.64','Pt = 257.91','Pt = 316.41','location','nw');
set(lgd,'FontSize',14);


Vin = [Vin1; Vin2; Vin3; Vin4; Vin5];           % Incompressible Velocity
Visen = [Vexit1; Vexit2; Vexit; Vexit; Vexit];  % Isentropic Velocity
   
figure;
plot(Pt,Vin,'.',Pt,Visen,'.','MarkerSize',30); grid on;
xlabel('Stagnation Pressure (kPa)', 'FontSize',14);
ylabel('Exit Mean Jet Velocity (m/s)', 'FontSize',14);
title('Exit Mean Jet Velocity vs. Chamber Stagnation Pressure', 'FontSize',14);
lgd = legend('Incompressible Assumption','Isentropic Assumption','location','nw');
set(lgd,'FontSize',14);

% Incompressible Velocity Profiles
vr1in = (2*1000.*(A1(:,5) - Patm)./ rhoatm ).^0.5;
vr1in = real(vr1in)
vr2in = (2*1000.*(A2(:,5) - Patm)./ rhoatm ).^0.5;
vr2in = real(vr2in)
vr3in = (2*1000.*(A3(:,5) - Patm)./ rhoatm ).^0.5;
vr3in = real(vr3in)
vr4in = (2*1000.*(A4(:,5) - Patm)./ rhoatm ).^0.5;
vr4in = real(vr4in)
vr5in = (2*1000.*(A5(:,5) - Patm)./ rhoatm ).^0.5;
vr5in = real(vr5in)

% Isentropic Temperature Profiles
Tr1 = T0 ./ (1 + ((gamma-1)/2).*(Mr1.^2))
Tr2 = T0 ./ (1 + ((gamma-1)/2).*(Mr2.^2))
Tr3 = T0 ./ (1 + ((gamma-1)/2).*(Mr3.^2))
Tr4 = T0 ./ (1 + ((gamma-1)/2).*(Mr4.^2))
Tr5 = T0 ./ (1 + ((gamma-1)/2).*(Mr5.^2))

% Isentropic Velocity Profiles
vr1_isen = Mr1.*(gamma*R.*Tr1).^0.5
vr2_isen = Mr2.*(gamma*R.*Tr2).^0.5
vr3_isen = Mr3.*(gamma*R.*Tr3).^0.5
vr4_isen = Mr4.*(gamma*R.*Tr4).^0.5
vr5_isen = Mr5.*(gamma*R.*Tr5).^0.5

% Isentropic Density Profiles
rho1_isen = Patm*1000./(R.*Tr1)
rho2_isen = Patm*1000./(R.*Tr2)
rho3_isen = Patm*1000./(R.*Tr3)
rho4_isen = Patm*1000./(R.*Tr4)
rho5_isen = Patm*1000./(R.*Tr5)


Vrin = [vr1in; vr2in; vr3in; vr4in; vr5in];         % Radial Velocity Profile Incompressible
Vrisen = [vr1_isen; vr2_isen; vr3_isen; vr4_isen; vr5_isen];    % Radial Velocity Profile Isentropic

figure;
plot(A1(:,3),vr1in,'r-o',A2(:,3),vr2in,'b-o',A3(:,3),vr3in,'g-o',A4(:,3),vr4in,'m-o',A5(:,3),vr5in,'k-o',A1(:,3),vr1_isen,'r-^',A2(:,3),vr2_isen,'b-^',A3(:,3),vr3_isen,'g-^',A4(:,3),vr4_isen,'m-^',A5(:,3),vr5_isen,'k-^'); 
grid on;
xlabel('Probe Position (mm)', 'FontSize',14);
ylabel('Exit Mean Jet Velocity (m/s)', 'FontSize',14);
title('Exit Mean Jet Velocity (m/s) vs. Probe Position', 'FontSize',14);
lgd = legend('Incompressible - Pt = 110.79','Incompressible - Pt = 164.44','Incompressible - Pt = 220.64','Incompressible - Pt = 257.91','Incompressible - Pt = 316.41','Isentropic - Pt = 110.79','Isentropic - Pt = 164.44','Isentropic - Pt = 220.64','Isentropic - Pt = 257.91','Isentropic - Pt = 316.41','location','nw');
set(lgd,'FontSize',9);


% Thrust Calculations
Thrust_direct = [mean(A1(:,2)); mean(A2(:,2)); mean(A3(:,2)); mean(A4(:,2)); mean(A5(:,2))]
thrustcompress
thrustincompress

% Radial Thrust
thrust_r1 = 0;
for i = 1:size(A1,1)
    r = abs(A1(i,3)/1000 - A1(end,3)/2000);
    if i == 1
        dr = A1(1,3)/1000;
    else
        dr = (A1(i,3) - A1(i-1,3))/1000;
    end
    thrust_r1 = thrust_r1 + (vr1_isen(i)^2) * rho1_isen(i) * 2*pi*r *dr;
end
thrust_r1 = thrust_r1/2

thrust_r2 = 0;
for i = 1:size(A2,1)
    r = abs(A2(i,3)/1000 - A2(end,3)/2/1000);
    if i == 1
        dr = A2(1,3)/1000;
    else
        dr = (A2(i,3) - A2(i-1,3))/1000;
    end
    thrust_r2 = thrust_r2 + (vr2_isen(i)^2) * rho2_isen(i) * 2*pi*r *dr;
end
thrust_r2 = thrust_r2/2

thrust_r3 = 0;
for i = 1:size(A3,1)
    r = abs(A3(i,3)/1000 - A3(end,3)/2/1000);
    if i == 1
        dr = A3(1,3)/1000;
    else
        dr = (A3(i,3) - A3(i-1,3))/1000;
    end
    thrust_r3 = thrust_r3 + (vr3_isen(i)^2) * rho3_isen(i) * 2*pi*r *dr;
end
thrust_r3 = thrust_r3/2

thrust_r4 = 0;
for i = 1:size(A4,1)
    r = abs(A4(i,3)/1000 - A4(end,3)/2/1000);
    if i == 1
        dr = A4(1,3)/1000;
    else
        dr = (A4(i,3) - A4(i-1,3))/1000;
    end
    thrust_r4 = thrust_r4 + (vr4_isen(i)^2) * rho4_isen(i) * 2*pi*r *dr;
end
thrust_r4 = thrust_r4/2

thrust_r5 = 0;
for i = 1:size(A5,1)
    r = abs(A5(i,3)/1000 - A5(end,3)/2/1000);
    if i == 1
        dr = A5(1,3)/1000;
    else
        dr = (A5(i,3) - A4(i-1,3))/1000;
    end
    thrust_r5 = thrust_r5 + (vr5_isen(i)^2) * rho5_isen(i) * 2*pi*r *dr;
end
thrust_r5 = thrust_r5/2

thrustr = [thrust_r1; thrust_r2; thrust_r3; thrust_r4; thrust_r5];

figure;
plot(Pt, Thrust_direct,'k-o',Pt,thrustincompress,'r-o',Pt,thrustcompress,'b-o',Pt,thrustr,'g-o');
grid on;
xlabel('Stagnation Pressure (kPa)', 'FontSize',14);
ylabel('Thrust (N)', 'FontSize',14);
title('Thrust vs. Stagnation Chamber Pressure', 'FontSize',14);
lgd = legend('Direct Measurement','Mean Velocity Incompressible','Mean Velocity Isentropic','Radial Velocity Profile Isentropic','location','nw');
set(lgd,'FontSize',12);


