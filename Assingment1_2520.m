%% MATLAB Assignment 1
% Ajinkya Joshi, EECE2520 Fundamentals of Linear Systems, February 9th, 2023 

%% QUESTION 1

%question 1a
u1 = @(n) ((n>=0) &(rem(n,1)==0));
n1 = 0:10;  % standard timescale for Question1a and b
xn1 = @(n) (1/2).^(n-2).*(u1(n)-u1(n-4)) + (u1(n-4)-u1(n-7));
figure(1);
stem(n1,xn1(n1),'fill') 
title('Question 1a')
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x[n]$'],'interpreter','latex')

%question 1b
figure(2);
stem(n1, xn1(n1-1),'fill')
title('Question 1b')
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x[n-1]$'],'interpreter','latex')

%question 1c
figure(3);
n2 = -10:0;  %Timescale was adjusted for the compressed signal
stem(n2, xn1(-2*n2 - 2),'fill')
%Labels
title('Question: 1c') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x[-2n-2]$'],'interpreter','latex')

%question 1d
figure(4);
n3 = 5:30;  %Timescale was adjusted for the expanded signal
stem(n3, xn1(n3/3 -2),'fill') 
title('Question 1d')
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x[\frac{n}{3} - 2]$'],'interpreter','latex')


%% QUESTION 2
%%
% $Period: x_1[n]$ 
%%
% $x_{1}[n] = 2sin(\frac{\pi}{N}n) + cos(\frac{3\pi}{N}n); N=4$ 
%%
% ${\Omega}_{o1}  = \frac{\pi}{4}$ 
%%
% $\frac{{\Omega}_{o1} }{2\pi} = \frac{m}{N_{o1}}= \frac{1}{8}: Rational -> periodic$ 
%%
% $N_{o1} = 8$ 
%%
% ${\Omega}_{o2}  = \frac{3\pi}{4}$ 
%%
% $\frac{{\Omega}_{o2} }{2\pi} = \frac{m}{N_{o2}} = \frac{3}{8}: Rational -> periodic$ 
%%
% $N_{o2} = 8$ 
%%
% $N_{o1} = N_{o2} = N_o = 8$ 
%%
% $Period: x_2[n]$
%%
% $x_{2}[n] = 2sin(\frac{3}{N}n) + cos(\frac{9}{N}n); N=4$ 
%%
% ${\Omega}_{o1}  = \frac{3}{4}; \frac{{\Omega}_{o2} }{2\pi} = \frac{m}{N_{o2}} = \frac{3}{8\pi}: Irrational -> aperiodic$ 

N = 4; 
nq2 = 0:4*N;  % time index
xq2_1 = 2 * sin( (pi/N) * nq2 ) + cos( ((3*pi)/N) * nq2 );
xq2_2 = 2 * sin( (3/N) * nq2 ) + cos( (9/N) * nq2 ); % plotting the original function

figure(5);
stem(nq2,xq2_1,'fill') 
title(['Graph of: ','$x_{1}[n]$'],'interpreter','latex') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x_{1}[n]$'],'interpreter','latex')

figure(6);
stem(nq2,xq2_2,'fill') 
title(['Graph of: ','$x_{2}[n]$'],'interpreter','latex') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x_{2}[n]$'],'interpreter','latex')


%%
%  For plot 1, the graph displays a periodic function. It is confirmed to 
% be periodic as the plot repeats itself every 8 steps. So: x[0]=x[8] and 
% x[1]=x[9] and x[n]=x[n+8]=x[n+16] etc.

%%
%  For plot 2, the graph displays a periodic function. It is confirmed to 
%  be periodic as the plot never repeats itself as the period is irrational 
%  and the graph displays no repeating periodic patterns. 

%% QUESTION 3

%Question 3a
phi_a = 0;
a_a = 0;
To_a = 10;% Fundamental period

t_step_a = To_a/100;   % time step
t_a = 0:t_step_a:4*To_a; % time array
x_r1 = 2 * exp(a_a*t_a).*cos(((2*pi)/To_a)*t_a + phi_a);% signal expression Re{x(t)}


figure(7);
plot(t_a,x_r1);
title('Question 3a') 
xlabel(['','$t$'],'interpreter','latex');
ylabel(['','$R_e{x(t)}$'],'interpreter','latex')

%Question 3b
phi_b = -pi/4; % shifts the signal to the right by pi/4
a_b = 0;
To_b = 10;% Fundamental period

t_step_b = To_b/100;   % time step
t_b = 0:t_step_b:4*To_b; % time array
x_r2 = 2 * exp(a_b*t_b).*cos(((2*pi)/To_b)*t_b + phi_b);% signal expression Re{x(t)}


figure(8);
plot(t_b,x_r2);
title('Question 3b') 
xlabel(['','$t$'],'interpreter','latex');
ylabel(['','$R_e{x(t)}$'],'interpreter','latex')


%Question 3c
phi_c = 0;
a_c = -0.05;
To_c = 10;% Fundamental period

t_step_c = To_c/100;   % time step
t_c = 0:t_step_c:4*To_c; % time array
x_r3 = 2 * exp(a_c*t_c).*cos(((2*pi)/To_c)*t_c + phi_c);% signal expression Re{x(t)}


figure(9);
plot(t_c,x_r3);
title('Question 3c') 
xlabel(['','$t$'],'interpreter','latex');
ylabel(['','$R_e{x(t)}$'],'interpreter','latex')

%%
%  Answer to question 3b: -pi/4 shifts the signal to the right.

%%
% Answer to question 3c: a value of -0.05 for the 'a' variable makes the 
% wave exponentially decay.

%% QUESTION 4

% Question 4 part 1
figure(10)
No_1 = 3;
nq4_1 = 0:2*No_1;
xq4_1 = cos( (2*pi/No_1) * nq4_1 );
stem(nq4_1,xq4_1,'fill') 
title('Question 4 part 1') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x[n]$'],'interpreter','latex')


% Question 4 part 2
figure(11)
k_1 = 1;
k_2 = 2;
k_3 = 3;
k_4 = 4;

%k=1
subplot(4,1,1)
xq4_2 = cos( (2*pi*k_1/No_1) * nq4_1 );
stem(nq4_1,xq4_2,'fill') 
title('Question 4 part 2, k = 1') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x_1[n]$'],'interpreter','latex')

%k=2
subplot(4,1,2)
xq4_3 = cos( (2*pi*k_2/No_1) * nq4_1 );
stem(nq4_1,xq4_3,'fill') 
title('Question 4 part 2, k = 2') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x_2[n]$'],'interpreter','latex')

%k=3
subplot(4,1,3)
xq4_4 = cos( (2*pi*k_3/No_1) * nq4_1 );
stem(nq4_1,xq4_4,'fill') 
title('Question 4 part 2, k = 3') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x_3[n]$'],'interpreter','latex')

%k=4
subplot(4,1,4)
xq4_5 = cos( (2*pi*k_4/No_1) * nq4_1 );
stem(nq4_1,xq4_5,'fill') 
title('Question 4 part 2, k = 4') 
xlabel(['','$n$'],'interpreter','latex');
ylabel(['','$x_4[n]$'],'interpreter','latex')

%%
%  Although four distinct signals have been plotted, there are two unique 
%  signals that are outputted. The first signal has peaks of magnitude 1 at
%  every third interval. Every other interval has reaches a point of 
%  magnitude -0.5.

%%
%  This is contrasted with the signal when k=3. All the intervals display 
%  a peak of magnitude 1. 

%% 
%  These results agree with the expected outputs. This output is expected 
%  to occur when $k = 3^{z}$ inputs. Where $z > 0$ . 
%  So k values of 9, 27, 81, etc will display the same output albeit with 
%  a higher frequency.    


